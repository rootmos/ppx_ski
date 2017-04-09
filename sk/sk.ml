open Sk_ast

module F(S: sig
  type t
  val to_string: t -> string
end) = struct

  let rec to_string = function
    | `S -> "S"
    | `K -> "K"
    | `Atom s -> S.to_string s
    | `Combinator c -> c
    | `Tree ts ->
        let s = List.map to_string ts |> String.concat "" in "(" ^ s ^ ")"

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
      let log' op = log d ast op in
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

  let merge a b = `Tree [a; b]

  let rec embedd = function
    | Sk_ast.S -> `S
    | Sk_ast.K -> `K
    | Sk_ast.Atom s -> `Atom s
    | Sk_ast.Combinator c -> `Combinator c
    | Sk_ast.Tree xs -> `Tree (List.map embedd xs)

  let parse s = Lexing.from_string s |> Ski_parser.expr Ski_lexer.read |> embedd

  let free ast =
    let rec go = function
      | `Atom s -> [s]
      | `Tree ts -> List.map go ts |> List.flatten
      | _ -> [] in
    go ast |> List.sort_uniq Pervasives.compare

  let eval_print s = derive s |> to_string |> print_endline
end

module Int = F(struct type t = int let to_string = string_of_int end)
module String = struct
  include F(struct type t = string let to_string s = s end)

  let rec repl () =
    print_string "SKI> ";
    try read_line () |> parse |> eval_print; repl ()
    with
      | Sys.Break -> ()
      | End_of_file -> ()
      | e -> Printexc.to_string e |> print_endline; repl ()
end
