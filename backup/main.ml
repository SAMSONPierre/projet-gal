let liste = ref [] in
let ch = open_in (Sys.argv.(1)) in
  let lexbuf = Lexing.from_channel ch in
  let rec f (t:Token.token ) =
    match t with
    | DIGIT i -> f (Lexeur.lexeur lexbuf)
    | INPUTSYMBOLS(i,j,k) -> (liste := i::j::k::(!liste) ) ; f (Lexeur.lexeur lexbuf)
    | OTHER -> f (Lexeur.lexeur lexbuf)
    | EOF ->List.iter print_char !liste; print_newline();
  in 
  f (Lexeur.lexeur lexbuf);;
