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
  {ppat_desc = Ppat_var {txt = s; loc = Location.none}; ppat_loc = Location.none; ppat_attributes = []}

let string_to_constant s =
  {pexp_desc = Pexp_constant (Const_string (s, None)); pexp_loc = Location.none; pexp_attributes = []}

let rec embedd_sk_ast = function
  | `S -> [%expr `S]
  | `K -> [%expr `K]
  | `Atom s -> [%expr `Atom [%e string_to_expression s]]
  | `Combinator c -> string_to_expression (mangle_combinator_name c)
  | `Tree xs ->
      let ys = List.map embedd_sk_ast xs in
      let es = List.fold_right cons ys [%expr []] in
      [%expr `Tree [%e es]]

let rec ocaml_ast_to_sk_ast = function
  | Pexp_ident {txt = Lident raw_sk} -> Sk.String.parse raw_sk
  | Pexp_construct ({txt = Lident raw_sk}, None) -> Sk.String.parse raw_sk
  | Pexp_construct ({txt = Lident raw_sk}, Some e) ->
      let l = Sk.String.parse raw_sk in
      let r = ocaml_ast_to_sk_ast e.pexp_desc in
      `Tree [l; r]
  | Pexp_apply ({pexp_desc = f}, xs) ->
      let f' = ocaml_ast_to_sk_ast f in
      xs
        |> List.map (fun (_, d) -> d.pexp_desc)
        |> List.map ocaml_ast_to_sk_ast
        |> List.fold_left Sk.String.merge f'
  | _ -> failwith "unexpected syntax in SKI-expression!"

let ski_mapper argv =
  { default_mapper with
    expr = (fun mapper expr ->
      match expr with
        | { pexp_loc = loc; pexp_desc = Pexp_constant (Const_string (raw_ski, Some ""))} ->
            let sk = Sk.String.parse raw_ski in
            let fv = Sk.String.free sk in
            let rec wrap = function
              | [] -> embedd_sk_ast sk
              | v :: vs -> [%expr ((fun [%p string_to_pattern v] -> [%e wrap vs]) [%e string_to_constant v])] in
            wrap fv
        | { pexp_loc = loc; pexp_desc = Pexp_constant (Const_string (raw_ski, Some "l"))} ->
            let sk = Sk.String.parse raw_ski in
            let fv = Sk.String.free sk in
            let rec wrap = function
              | [] -> embedd_sk_ast sk
              | v :: vs -> [%expr (fun [%p string_to_pattern v] -> [%e wrap vs])] in
            wrap fv
        | x -> default_mapper.expr mapper x);
    structure_item = fun mapper str ->
      begin match str with
        | { pstr_desc = Pstr_extension (({txt="ski"}, PStr [{pstr_desc = Pstr_value (rec_flag, [b])}]), _)} ->
            begin match b with
            | { pvb_pat = {ppat_desc = Ppat_construct ({txt = Lident d}, None)}; pvb_expr = { pexp_desc = pd }} ->
                let ski = ocaml_ast_to_sk_ast pd |> embedd_sk_ast in
                let d' = mangle_combinator_name d |> string_to_pattern in
                [%stri let [%p d'] = [%e ski]]
            | _ -> failwith "unexpected pattern"
            end
        | x -> default_mapper.structure_item mapper x
      end;
  }

let () = register "ski" ski_mapper
