ppx_ski
=======
[SKI combinator calculus](https://en.wikipedia.org/wiki/SKI_combinator_calculus) implemented in OCaml supported by a ppx extension.

Syntax
------
The new syntaxes introduced by `ppx_ski` are:
* `let%ski C = <SKI-expression>`
* `{|SKI-expression|}`
* `{l|SKI-expression|l}` (which returns a lambda)

REPL
----
There's a simple `repl` included to let you evaluate SKI-expressions.
To build it: run `make repl` (just a `Makefile` wrapper around `ocamlbuild`).

```
SKI> ((S((SK)K))((SK)K))a
(a(a))
SKI> ((S(K((S((S(K((S(KS))K)))S))(KK))))((S(K(S((SK)K))))K))abc
(c(a)(b))
SKI>
```

Setting the environment variable `SKI_LOG=1` will show the derivations as they happen.

Examples
--------
Examples of some [birds](http://www.angelfire.com/tx4/cus/combinator/birds.html):

```ocaml
(* kite returns second argument *)
{|KIab|} |> Sk.String.eval_print;
  (* prints: (b) *)

(* transform your expression into a lambda *)
{l|SIIa|l} 1 |> Sk.Int.eval_print;
  (* prints: (1(1)) *)

(* ornithology: cardinals and larks (and more) are defined in the Birds module*)
let open Birds in
  {|Cabc|} |> Sk.String.eval_print;
    (* prints: (ac(b)) *)

  {|Lab|} |> Sk.String.eval_print
    (* prints: (a(b(b))) *)
```

The curious can set the environment variable `SKI_LOG=1` here as well to see what's going on under the hood.


References
----------
* To learn about ppx extensions, I followed this nice [blog](https://whitequark.org/blog/2014/04/16/a-guide-to-extension-points-in-ocaml) and referenced the [source](https://github.com/ocaml/ocaml/blob/trunk/parsing/parsetree.mli) when in need of documentation.
* Implementing this would have been a pain without the [ppx_tools](https://github.com/alainfrisch/ppx_tools).
