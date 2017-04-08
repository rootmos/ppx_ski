type op = S | K | I | Atom of string
type expr = Op of op | Tree of expr list
