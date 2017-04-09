val to_string : Sk_ast.expr -> string
val derive : Sk_ast.expr -> Sk_ast.expr
val parse : string -> Sk_ast.expr
val merge : Sk_ast.expr -> Sk_ast.expr -> Sk_ast.expr
val lift : ([< `K | `S | `Atom of string | `Tree of 'a list ] as 'a) -> Sk_ast.expr
val embedd : Sk_ast.expr -> ([> `Atom of string | `K | `S | `Tree of 'a list ] as 'a)
