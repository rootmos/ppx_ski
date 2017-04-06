{
  open Ski_parser
  module L = Lexing
  exception Syntax_error of string
}

rule read = parse
  | '(' { LEFT_PAREN }
  | ')' { RIGHT_PAREN }
  | 'S' { S }
  | 'K' { K }
  | 'I' { I }
  | eof { EOF }
  | _ { raise (Syntax_error ("Unknown character: " ^ L.lexeme lexbuf)) }

{
  let tokens lexbuf =
    let rec go xs = function
      | EOF -> List.rev (EOF :: xs)
      | x -> go (x :: xs) (read lexbuf) in
    go [] (read lexbuf)
}
