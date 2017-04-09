let () =
  (* kite returns second argument *)
  {|KIab|} 1 2
    |> Sk.derive' string_of_int |> Sk.to_string' string_of_int |> print_endline;
    (* prints: (2) *)

  (* bind your expression to a lambda *)
  {|SIIa|} "x"
    |> Sk.derive |> Sk.to_string |> print_endline;
    (* prints: (x(x)) *)

  (* ornithology: cardinals and larks (and more) are defined in the Birds module*)
  let open Birds in
    {|Cabc|} "a" "b" "c"
      |> Sk.derive |> Sk.to_string |> print_endline;
      (* prints: (ac(b)) *)

    {|Lab|} "a" "b"
      |> Sk.derive |> Sk.to_string |> print_endline
      (* prints: (a(b(b))) *)
