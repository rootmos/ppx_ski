open Birds

let () =
  (* kite returns second argument *)
  let f a b = {|KIab|} in f 1 2
    |> Sk.derive' string_of_int |> Sk.to_string' string_of_int |> print_endline;
    (* prints: (2) *)

  (* bind your expression to a lambda *)
  let m a = {|SIIa|} in m "x"
    |> Sk.derive |> Sk.to_string |> print_endline;
    (* prints: (x(x)) *)

  (* ornithology: cardinals and larks (and more) are defined in the Birds module*)
  (fun a b c -> {|Cabc|}) "a" "b" "c"
    |> Sk.derive |> Sk.to_string |> print_endline;
    (* prints: (ac(b)) *)

  (fun a b -> {|Lab|}) "a" "b"
    |> Sk.derive |> Sk.to_string |> print_endline
    (* prints: (a(b(b))) *)
