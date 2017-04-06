open Ast_mapper
open Ast_helper
open Asttypes
open Parsetree
open Longident

let parse s = Lexing.from_string s |> Ski_parser.expr Ski_lexer.read

let app f x = [%expr [%e f] [%e x]]

let transform e =
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

let ski_mapper argv =
  { default_mapper with
    expr = fun mapper expr -> match expr with
      | { pexp_loc = loc; pexp_desc = Pexp_constant (Const_string (raw_ski, Some ""))} ->
          parse raw_ski |> transform
      | x -> default_mapper.expr mapper x;
  }

let () = register "ski" ski_mapper
