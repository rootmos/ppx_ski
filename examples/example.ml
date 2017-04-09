let () =
  (* kite returns second argument *)
  {|KIab|}
    |> Sk.derive |> Sk.to_string |> print_endline;
    (* prints: (b) *)

  (* transform your expression into a lambda *)
  {l|SIIa|l} 1
    |> Sk.derive' string_of_int |> Sk.to_string' string_of_int |> print_endline;
    (* prints: (1(1)) *)

  (* ornithology: cardinals and larks (and more) are defined in the Birds module*)
  let open Birds in
    {|Cabc|}
      |> Sk.derive |> Sk.to_string |> print_endline;
      (* prints: (ac(b)) *)

    {|Lab|}
      |> Sk.derive |> Sk.to_string |> print_endline
      (* prints: (a(b(b))) *)
