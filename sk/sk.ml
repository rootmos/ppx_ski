open Sk_ast

let rec to_string' f = function
  | `S -> "S"
  | `K -> "K"
  | `Atom s -> f s
  | `Combinator c -> c
  | `Tree ts ->
      let s = List.map (to_string' f) ts |> String.concat "" in
      "(" ^ s ^ ")"

let to_string = to_string' (fun x -> x)

let logging_enabled =
  try Sys.getenv "SKI_LOG" = "1"
  with Not_found -> false

let log f d ast op ast' =
  if logging_enabled
  then Printf.printf "derivation (depth=%2d) [%2s] %s -> %s\n" d op (to_string' f ast) (to_string' f ast')
  else (); ast'

let derive' f ast =
  let rec go d ast =
    let step = go (d+1) in
    let log' op = log f d ast op in
    match ast with
      | `Tree ((`Tree hs) :: ts) ->
          `Tree (hs @ ts) |> step |> log' "()"
      | `Tree (`K :: x :: _ :: ts') ->
          `Tree (x :: ts') |> step |> log' " K"
      | `Tree (`S :: x :: y :: z :: ts') ->
          `Tree (x :: z :: `Tree [y; z] :: ts') |> step |> log' " S"
      | `Tree ts -> `Tree (List.map step ts) |> log' "fβ"
      | irr -> irr in
  go 0 ast

let derive = derive' (fun x -> x)

let merge a b = `Tree [a; b]

let rec embedd = function
  | Sk_ast.S -> `S
  | Sk_ast.K -> `K
  | Sk_ast.Atom s -> `Atom s
  | Sk_ast.Combinator c -> `Combinator c
  | Sk_ast.Tree xs -> `Tree (List.map embedd xs)

let parse s = Lexing.from_string s |> Ski_parser.expr Ski_lexer.read |> embedd

