let inputs = ref [] in
let stacks = ref [] in
let states = ref [] in
let initStack = ref [] in
let initState = ref [] in
let traitement (text:string) :string list=
    let list=String.split_on_char ' ' text in
    List.filter (fun y -> y <> ",") list in

let ch = open_in (Sys.argv.(1)) in
  let lexbuf = Lexing.from_channel ch in
  let rec f (t:Token.token ) =
    match t with
    | DIGIT i -> f (Lexeur.lexeur lexbuf)
    | STATES state -> (states := traitement(state)@(!states) ) ; f (Lexeur.lexeur lexbuf)
    | INPUTSYMBOLS(rest) -> (inputs := traitement(rest)@(!inputs) ) ; f (Lexeur.lexeur lexbuf)
    | STACKSYMBOLS(stack) -> (stacks := traitement(stack)@(!stacks)); f (Lexeur.lexeur lexbuf)
    | INITIALSTACK(stackInit) -> (initStack := traitement(stackInit)@(!initStack)); f (Lexeur.lexeur lexbuf)
    | INITIALSTATE(stateInit) -> (initState := traitement(stateInit)@(!initState)); f (Lexeur.lexeur lexbuf)
    | OTHER -> f (Lexeur.lexeur lexbuf)
    | EOF ->List.iter print_string !inputs; print_newline();
            List.iter print_string !stacks; print_newline();
            List.iter print_string !states; print_newline();
            List.iter print_string !initState; print_newline();
            List.iter print_string !initStack; print_newline();

  in 
  f (Lexeur.lexeur lexbuf);;
