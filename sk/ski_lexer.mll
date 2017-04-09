{
  open Ski_parser
  module L = Lexing
  exception Syntax_error of string
}

let atom_initial_char = (['A'-'Z']#['S' 'K' 'I']) | ['a'-'z']
let atom_subsequent_char = ['0' - '9']
let atom = atom_initial_char atom_subsequent_char*

rule read = parse
  | '(' { LEFT_PAREN }
  | ')' { RIGHT_PAREN }
  | 'S' { S }
  | 'K' { K }
  | 'I' { I }
  | atom { ATOM (L.lexeme lexbuf) }
  | eof { EOF }
  | _ { raise (Syntax_error ("Unknown character: " ^ L.lexeme lexbuf)) }

{
  let tokens lexbuf =
    let rec go xs = function
      | EOF -> List.rev (EOF :: xs)
      | x -> go (x :: xs) (read lexbuf) in
    go [] (read lexbuf)
}
