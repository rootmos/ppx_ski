let () =
  (* kite returns second argument *)
  {|KIab|} |> Sk.String.eval_print;
    (* prints: (b) *)

  (* transform your expression into a lambda *)
  {l|SIIa|l} 1 |> Sk.Int.eval_print;
    (* prints: (1(1)) *)

  (* ornithology: cardinals and larks (and more) are defined in the Birds module*)
  let open Birds in
    {|Cabc|} |> Sk.String.eval_print;
      (* prints: (ac(b)) *)

    {|Lab|} |> Sk.String.eval_print
      (* prints: (a(b(b))) *)
