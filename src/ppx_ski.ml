open Ast_mapper
open Ast_helper
open Asttypes
open Parsetree
open Longident

let ski_mapper argv =
  { default_mapper with
    expr = fun mapper expr -> match expr with
      | { pexp_loc = loc; pexp_desc = Pexp_constant (Const_string (raw_ski, _))} ->
        [%expr 2 + 2]
      | x -> default_mapper.expr mapper x;
  }

let () = register "ski" ski_mapper
