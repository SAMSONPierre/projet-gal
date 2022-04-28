let inputs = ref [] in
let stacks = ref [] in
let states = ref [] in
let initStack = ref [] in
let initState = ref [] in
let transition= ref "" in
let verif = ref "" in
let redondant=ref [] in
let traitement (text:string) :string list=
    let list=String.split_on_char ' ' text in
    List.filter (fun y -> y <> ",") list in
let ch = open_in (Sys.argv.(1)) in
  let lexbuf = Lexing.from_channel ch in
  let rec f (t:Token.token ) =
    match t with
    | VERIF(input,stack,state,stateInit,stackInit,trans) -> (inputs := traitement(input)@(!inputs) ) ;
                                                            (stacks := traitement(stack)@(!stacks));
                                                            (states := traitement(state)@(!states) ) ;
                                                            (initState := traitement(stackInit)@(!initState));
                                                            (initStack := traitement(stateInit)@(!initStack));
                                                            transition:=trans;
                                                            f (Lexeur.lexeur lexbuf);
    
    | NEXT(mot) -> redondant := !redondant @ [mot]  ; f (Lexeur.lexeur lexbuf)
    | EOF ->List.iter print_string !inputs; print_newline();
            List.iter print_string !stacks; print_newline();
            List.iter print_string !states; print_newline();
            List.iter print_string !initState; print_newline();
            List.iter print_string !initStack; print_newline();
            print_string !transition; print_newline();
            print_string !verif; print_newline();
            print_string "------------redondant----------";print_newline();
            List.iter print_string !redondant; print_newline();
            if (!redondant=[]) && not ( !initState=[]) && not (!transition ="")then
              print_string "format respecté"
            else
              print_string "format non respecté"
            ;print_newline()
  in 
  f (Lexeur.lexeur lexbuf);;
