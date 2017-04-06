type op = S | K | I
type expr = Op of op | Tree of expr list
