open Sk_ast

let rec to_string = function
  | S -> "S"
  | K -> "K"
  | Atom a -> a
  | Combinator c -> c
  | Tree ts ->
      let s = List.map to_string ts |> String.concat "" in
      "(" ^ s ^ ")"

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
    | Tree ((Tree hs) :: ts) ->
        Tree (hs @ ts) |> step |> log' "()"
    | Tree (K :: x :: _ :: ts') ->
        Tree (x :: ts') |> step |> log' "K"
    | Tree (S :: x :: y :: z :: ts') ->
        Tree (x :: z :: Tree [y; z] :: ts') |> step |> log' "S"
    | Tree ts ->
        Tree (List.map step ts) |> log' "fβ"
    | irr -> irr in
  go 0 ast

let merge a b = match (a, b) with
  | Tree ta, Tree tb -> Tree (List.append ta tb)
  | Tree ta, ob -> Tree (List.append ta [ob])
  | oa, Tree tb -> Tree (List.append [oa] tb)
  | oa, ob -> Tree [oa; ob]

let merge' a b = match (a, b) with
  | `Tree ta, `Tree tb -> `Tree (List.append ta tb)
  | `Tree ta, ob -> `Tree (List.append ta [ob])
  | oa, `Tree tb -> `Tree (List.append [oa] tb)
  | oa, ob -> `Tree [oa; ob]

let parse s = Lexing.from_string s |> Ski_parser.expr Ski_lexer.read

let rec lift = function
  | `K -> K
  | `S -> S
  | `Atom s -> Atom s
  | `Combinator c -> Combinator c
  | `Tree xs -> Tree (List.map lift xs)

let rec embedd = function
  | Sk_ast.S -> `S
  | Sk_ast.K -> `K
  | Sk_ast.Atom s -> `Atom s
  | Sk_ast.Combinator c -> `Combinator c
  | Sk_ast.Tree xs -> `Tree (List.map embedd xs)
