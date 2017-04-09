open Ast_mapper
open Asttypes
open Parsetree
open Longident

let app f x = [%expr [%e f] [%e x]]
let cons x xs = [%expr [%e x] :: [%e xs]]

let mangle_combinator_name s = "combinator_" ^ s

let string_to_expression s =
  {pexp_desc = Pexp_ident {txt = Lident s; loc = Location.none}; pexp_loc = Location.none; pexp_attributes = []}

let string_to_pattern s =
  {ppat_desc = Ppat_construct ({txt = Lident s; loc = Location.none}, None); ppat_loc = Location.none; ppat_attributes = []}

let sk_ast_to_ocaml_ast e =
  let s = [%expr (fun x y z -> x z (y z))] in
  let k = [%expr (fun x y -> x)] in
  let rec go = function
  | Sk_ast.S -> [%expr [%e s]]
  | Sk_ast.K -> [%expr [%e k]]
  | Sk_ast.Atom s -> string_to_expression s
  | Sk_ast.Tree [] -> [%expr ()]
  | Sk_ast.Tree (x :: xs) -> List.map go xs |> List.fold_left app (go x) in
  go e

let rec embedd_sk_ast = function
  | Sk_ast.S -> [%expr `S]
  | Sk_ast.K -> [%expr `K]
  | Sk_ast.Atom s -> [%expr `Atom [%e string_to_expression s]]
  | Sk_ast.Tree xs ->
      let ys = List.map embedd_sk_ast xs in
      let es = List.fold_right cons ys [%expr []] in
      [%expr `Tree [%e es]]

let rec ocaml_ast_to_sk_ast = function
  | Pexp_ident {txt = Lident raw_sk} -> Sk.parse raw_sk
  | Pexp_construct ({txt = Lident raw_sk}, None) -> Sk.parse raw_sk
  | Pexp_construct ({txt = Lident raw_sk}, Some e) ->
      let l = Sk.parse raw_sk in
      let r = ocaml_ast_to_sk_ast e.pexp_desc in
      Sk_ast.Tree [l; r]
  | Pexp_apply ({pexp_desc = f}, xs) ->
      let f' = ocaml_ast_to_sk_ast f in
      xs
        |> List.map (fun (_, d) -> d.pexp_desc)
        |> List.map ocaml_ast_to_sk_ast
        |> List.fold_left Sk.merge f'
  | _ -> failwith "unexpected syntax in SKI-expression!"

let ski_mapper argv =
  { default_mapper with
    expr = (fun mapper expr ->
      match expr with
        | { pexp_loc = loc; pexp_desc = Pexp_constant (Const_string (raw_ski, Some ""))} ->
            Sk.parse raw_ski |> Sk.derive |> embedd_sk_ast
        | x -> default_mapper.expr mapper x);
    structure_item = fun mapper str ->
      begin match str with
        | { pstr_desc = Pstr_extension (({txt="ski"}, PStr [{pstr_desc = Pstr_value (rec_flag, [b])}]), _)} ->
            begin match b with
            | { pvb_pat = {ppat_desc = Ppat_construct ({txt = Lident d}, None)}; pvb_expr = { pexp_desc = pd }} ->
                let ski = ocaml_ast_to_sk_ast pd |> Sk.derive |> embedd_sk_ast in
                let d' = mangle_combinator_name d |> string_to_pattern in
                [%stri let [%p d'] = [%e ski]]
            | _ -> failwith "unexpected pattern"
            end
        | x -> default_mapper.structure_item mapper x
      end;
  }

let () = register "ski" ski_mapper
