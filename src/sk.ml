type op = S | K | Atom of string
type expr = Op of op | Tree of expr list

let rec to_string = function
  | Op S -> "S"
  | Op K -> "K"
  | Op (Atom a) -> a
  | Tree ts ->
      let s = List.map to_string ts |> String.concat "" in
      "(" ^ s ^ ")"

let rec desugar = function
  | Ast.Op Ast.S -> Op S
  | Ast.Op Ast.K -> Op K
  | Ast.Op (Ast.Atom v) -> Op (Atom v)
  | Ast.Op Ast.I -> Tree [(Op S); (Op K); (Op K)]
  | Ast.Tree ts -> Tree (Misc.map_end desugar ts [])

let logging_enabled =
  try Sys.getenv "SKI_LOG" = "1"
  with Not_found -> false

let log d ast op ast' =
  if logging_enabled
  then Printf.printf "derivation (depth=%2d) [%2s] %s -> %s\n" d op (to_string ast) (to_string ast')
  else (); ast'

let derive ast =
  let rec go d ast =
    let step = go (d+1) in
    let log' = log d ast in
    match ast with
    | Op o -> Op o
    | Tree ((Tree hs) :: ts) ->
        Tree (hs @ ts) |> step |> log' "()"
    | Tree (Op K :: x :: _ :: ts') ->
        Tree (x :: ts') |> step |> log' "K"
    | Tree (Op S :: x :: y :: z :: ts') ->
        Tree (x :: z :: Tree [y; z] :: ts') |> step |> log' "S"
    | t -> log' "  " t in
  go 0 ast

let merge a b = match (a, b) with
  | Op oa, Op ob -> Tree [Op oa; Op ob]
  | Tree ta, Op ob -> Tree (List.append ta [Op ob])
  | Op oa, Tree tb -> Tree (List.append [Op oa] tb)
  | Tree ta, Tree tb -> Tree (List.append ta tb)

let parse s = Lexing.from_string s |> Ski_parser.expr Ski_lexer.read |> desugar
