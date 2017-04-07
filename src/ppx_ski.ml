open Ast_mapper
open Ast_helper
open Asttypes
open Parsetree
open Longident

let parse s = Lexing.from_string s |> Ski_parser.expr Ski_lexer.read

let app f x = [%expr [%e f] [%e x]]

let ski_ast_to_ocaml_ast e =
  let s = [%expr (fun x y z -> x z (y z))] in
  let k = [%expr (fun x y -> x)] in
  let i = [%expr (fun x -> x)] in
  let rec go = function
  | Ast.Op Ast.S -> [%expr [%e s]]
  | Ast.Op Ast.K -> [%expr [%e k]]
  | Ast.Op Ast.I -> [%expr [%e i]]
  | Ast.Tree [] -> [%expr ()]
  | Ast.Tree (x :: xs) -> List.map go xs |> List.fold_left app (go x) in
  go e

let rec ocaml_ast_to_ski_ast = function
  | Pexp_construct ({txt = Lident raw_ski}, _) -> parse raw_ski
  | Pexp_apply ({pexp_desc = f}, xs) ->
      let f' = ocaml_ast_to_ski_ast f in
      let ys = Misc.map_end (fun (_, d) -> ocaml_ast_to_ski_ast d.pexp_desc) xs [] in
      Ast.Tree (f' :: ys)
  | _ -> failwith "unexpected syntax in SKI-expression!"

let ski_mapper argv =
  { default_mapper with
    expr = (fun mapper expr ->
      match expr with
        | { pexp_loc = loc; pexp_desc = Pexp_constant (Const_string (raw_ski, Some "sk"))} ->
            parse raw_ski |> ski_ast_to_ocaml_ast
        | x -> default_mapper.expr mapper x);
    structure_item = fun mapper str ->
      begin match str with
        | { pstr_desc = Pstr_extension (({txt="ski"}, PStr [{pstr_desc = Pstr_value (rec_flag, [b])}]), _)} ->
            begin match b with
            | { pvb_pat = d; pvb_expr = { pexp_desc = pd }} ->
                let ski = ocaml_ast_to_ski_ast pd |> ski_ast_to_ocaml_ast in
                [%stri let [%p d] = (fun x -> [%e ski] x)]
            | _ -> failwith "ops!"
            end
        | x -> default_mapper.structure_item mapper x
      end;
  }

let () = register "ski" ski_mapper
