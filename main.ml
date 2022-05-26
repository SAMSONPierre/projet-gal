let inputs = ref [] in
let stacks = ref [] in
let states = ref [] in
let initStack = ref [] in
let initState = ref [] in
let transition= ref "" in
let verif = ref "" in
let redondant=ref [] in
let traitement x =
  let l1=String.split_on_char ',' x in 
  let l2=List.filter(fun y->y<>"") l1 in 
  let rec lsansespace l=
    match l with
    |a::b->let lmot=String.split_on_char ' ' a in
        let lmot2=List.filter (fun y -> y<>"") lmot in 
        if(lmot2==[])then
          lsansespace b
        else
          lmot2::lsansespace b
    |[]->[]
  in 
  let l3=lsansespace l2 in 
  let rec listlistTolist l=
    match l with
    |a::b->a@listlistTolist b
    |[]->[]
  in
  listlistTolist l3 
in
let ch = open_in (Sys.argv.(1)) in
  let lexbuf = Lexing.from_channel ch in
  let rec f (t:Token.token ) =
    match t with
    | VERIF(input,stack,state,stateInit,stackInit,trans) -> (inputs := traitement(input)@(!inputs) ) ;
                                                            (stacks := traitement(stack)@(!stacks));
                                                            (states := traitement(state)@(!states) ) ;
                                                            (initState := traitement(stateInit)@(!initState));
                                                            (initStack := traitement(stackInit)@(!initStack));
                                                            transition:=trans;
                                                            f (Lexeur.lexeur lexbuf);
    
    | NEXT(mot) -> redondant := !redondant @ [mot]; f (Lexeur.lexeur lexbuf)
    | EOF ->List.iter print_string !inputs; print_newline();
            List.iter print_string !stacks; print_newline();
            List.iter print_string !states; print_newline();
            List.iter print_string !initState; print_newline();
            List.iter print_string !initStack; print_newline();
            print_string !transition; print_newline();
            print_string !verif; print_newline();
            (*verification *)
            let rec ainb a b=
              match a with
              |x::y-> 
                  if(List.mem x b) then 
                    ainb y b
                  else
                    false
              |[]-> true
            in
            if (!redondant=[]) && not ( !initState=[]) && not (!transition ="") then
              print_string "format respecté"
            else
              print_string "format non respecté----";
            print_newline();
            
            if (ainb !initState !states) then
              print_string "initial state respecté"
            else
              print_string "initial state non respecté";
            print_newline();

            if (ainb !initStack !stacks) then
              print_string "initial stack respecté"
            else 
              print_string "initial stack non respecté";
            print_newline();
            (*List.iter print_string !redondant; print_newline();*)
              
  in 
  f (Lexeur.lexeur lexbuf);;
