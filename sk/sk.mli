val to_string : Sk_ast.expr -> string
val derive : Sk_ast.expr -> Sk_ast.expr
val parse : string -> Sk_ast.expr
val merge : Sk_ast.expr -> Sk_ast.expr -> Sk_ast.expr
val merge' :
  ([< `K | `S | `Atom of string | `Combinator of string | `Tree of 'a list ] as 'a) ->
  ([< `K | `S | `Atom of string | `Combinator of string | `Tree of 'a list ] as 'a) ->
  ([> `K | `S | `Atom of string | `Combinator of string | `Tree of 'a list ] as 'a)
val lift : ([< `K | `S | `Atom of string | `Combinator of string | `Tree of 'a list ] as 'a) -> Sk_ast.expr
val embedd : Sk_ast.expr -> ([> `Atom of string | `Combinator of string | `K | `S | `Tree of 'a list ] as 'a)
