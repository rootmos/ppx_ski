open Birds

let () =
  let f a b = {|KIab|} in f 1 2
    |> Sk.derive' string_of_int |> Sk.to_string' string_of_int |> print_endline;

  let m a = {|SIIa|} in m "x"
    |> Sk.derive |> Sk.to_string |> print_endline;

  (fun a b c -> {|Cabc|}) "a" "b" "c"
    |> Sk.derive |> Sk.to_string |> print_endline;

  (fun a b -> {|Lab|}) "a" "b"
    |> Sk.derive |> Sk.to_string |> print_endline
