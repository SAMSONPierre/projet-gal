let somme = ref 0 in
let ch = open_in (Sys.argv.(1)) in
  let lexbuf = Lexing.from_channel ch in
  let rec f (t:Token.token ) =
    match t with
    | DIGIT i -> (somme := i + (!somme) ) ; f (Lexeur.lexeur lexbuf)
    | OTHER -> f (Lexeur.lexeur lexbuf)
    | EOF -> print_int !somme; print_newline()
  in 
  f (Lexeur.lexeur lexbuf);;
