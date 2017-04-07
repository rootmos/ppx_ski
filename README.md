ppx_ski
=======
[SKI](https://en.wikipedia.org/wiki/SKI_combinator_calculus) as a shallow embedding into OCaml using ppx extensions.

Syntax
------
The new syntaxes introduced by `ppx_ski` are:
* `let%ski f = <SKI-expression>`, and
* `{|SKI-expression|}`.

Examples
--------
Examples of some [birds](http://www.angelfire.com/tx4/cus/combinator/birds.html):

```
utop # let%ski kestrel = K;;
val kestrel : 'a -> 'b -> 'a = <fun>
```

```
utop # let%ski kite = KI;;
val kite : 'a -> 'b -> 'b = <fun>
```

```
utop # {|(S(K(S((SK)K))))K|};;
- : '_a -> ('_a -> '_b) -> '_b
```

References
----------
To learn about ppx extensions, I followed this nice [blog](https://whitequark.org/blog/2014/04/16/a-guide-to-extension-points-in-ocaml)
and referenced the [source](https://github.com/ocaml/ocaml/blob/trunk/parsing/parsetree.mli) when in need of documentation.
