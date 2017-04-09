ppx_ski
=======
[SKI combinator calculus](https://en.wikipedia.org/wiki/SKI_combinator_calculus) implemented in OCaml supported by a ppx extension.

Syntax
------
The new syntaxes introduced by `ppx_ski` are:
* `let%ski C = <SKI-expression>`
* `{|SKI-expression|}`
* `{l|SKI-expression|l}` (which returns a lambda)

Examples
--------
Examples of some [birds](http://www.angelfire.com/tx4/cus/combinator/birds.html):

```ocaml
(* kite returns second argument *)
{|KIab|}
  |> Sk.derive |> Sk.to_string |> print_endline;
  (* prints: (b) *)

(* transform your expression into a lambda *)
{l|SIIa|l} 1
  |> Sk.derive' string_of_int |> Sk.to_string' string_of_int |> print_endline;
  (* prints: (1(1)) *)

(* ornithology: cardinals and larks (and more) are defined in the Birds module*)
let open Birds in
  {|Cabc|}
    |> Sk.derive |> Sk.to_string |> print_endline;
    (* prints: (ac(b)) *)

  {|Lab|}
    |> Sk.derive |> Sk.to_string |> print_endline
    (* prints: (a(b(b))) *)
```

The curious can set the environment variable `SKI_LOG=1` and see the derivations as they happen.


References
----------
To learn about ppx extensions, I followed this nice [blog](https://whitequark.org/blog/2014/04/16/a-guide-to-extension-points-in-ocaml)
and referenced the [source](https://github.com/ocaml/ocaml/blob/trunk/parsing/parsetree.mli) when in need of documentation.
