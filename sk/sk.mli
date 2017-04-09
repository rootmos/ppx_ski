val to_string : ([< `K | `S | `Atom of string | `Combinator of string | `Tree of 'a list ] as 'a) -> string
val to_string' : ('b -> string) -> ([< `K | `S | `Atom of 'b | `Combinator of string | `Tree of 'a list ] as 'a) -> string

val derive : ([< `K | `S | `Atom of string | `Combinator of string | `Tree of 'a list > `K `S `Tree] as 'a) -> 'a
val derive' : ('b -> string) -> ([< `K | `S | `Atom of 'b | `Combinator of string | `Tree of 'a list > `K `S `Tree] as 'a) -> 'a

val parse : string -> ([> `Atom of string | `Combinator of string | `K | `S | `Tree of 'a list ] as 'a)

val merge :
  ([< `K | `S | `Atom of 'b | `Combinator of string | `Tree of 'a list ] as 'a) ->
  ([< `K | `S | `Atom of 'b | `Combinator of string | `Tree of 'a list ] as 'a) ->
  ([> `K | `S | `Atom of 'b | `Combinator of string | `Tree of 'a list ] as 'a)

val free: ([> `Atom of 'b | `Tree of 'a list ] as 'a) -> 'b list
