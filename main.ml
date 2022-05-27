open Ast 
let lexbuf = Lexing.from_channel stdin 
let mots=Array.get Sys.argv 1
let ast = Parser.input Lexer.main lexbuf
let _ = Printf.printf "Parse:\n%s\n" (as_string ast)


let rec est_present elem liste = 
  match liste with
  | h::q -> if(elem = h) then true
            else est_present(elem)(q)
  | [] -> false
;;

let rec pas_epsilon transitions =
  match transitions with
  | (v1,None,v2,v3,v4)::q -> false
  | h::q -> pas_epsilon(q)
  | [] -> true

  let rec print_list l sep = match l with
  | [] -> ""
  | h::[] -> Printf.sprintf "%c" h
  | h::q -> Printf.sprintf "%c %s %s" h sep ((print_list q sep))

  let rec check_transition_state state transitions deja_vu=
    match transitions with
    | (v1,Some(v2),v3,v4,v5)::q when (v1 == state) ->  
      if(est_present(v2)(deja_vu)) then 
        false
      else
        check_transition_state(state)(q)(v2::deja_vu)
    | (v1,Some(v2),v3,v4,v5)::q when (v1 != state) ->  
      check_transition_state(state)(q)(deja_vu)
    | (v1,None,v3,v4,v5)::q -> false
    | h::q -> failwith("pas normal")
    | [] -> true
;;

let rec check_transition_for_states states transitions =
  match states with
  | h::q -> 
    if(check_transition_state(h)(transitions)([])) then 
      check_transition_for_states q transitions
    else
      false  
  | [] -> true
    

(* TODO :    
  Première partie : faire la gestion des erreurs 
    — il n’y a aucune transition qui s’applique ;
    — l’entrée est épuisée sans que la pile soit vide ;
    — la pile est vide sans que l’entrée soit épuisée.
  Deuxième partie : done
*)
open Stack;;
let stringToList str = List.init (String.length str) (String.get str);;
let excecute ast mot=
  let mot =create() in
  let etat = ref ' ' in
  let pile = create() in
  let currentCarac= ref ' ' in
  let currentStack= ref ' ' in

  let rec pushAll lis pi=
    match lis with 
    |x::y->push x pi;pushAll y pi 
    |[]->()
  in
  let endTest()=
    if(!currentStack=' ' && !currentCarac=' ')then
      print_string "\nEND\n"
    else
      print_string "\nEND\n"
  in
  let getPileContent pile =
    let p=Stack.copy pile in
    let res=ref "" in
    while not(is_empty p) do
      res:=(Char.escaped (pop p))^ !res
    done; 
    res
  in
  let rec deplace newEtat motChange ajoutPile transition=
    print_string ("\n("^(Char.escaped !etat)^","^ !(getPileContent mot)^(Char.escaped !currentCarac)^","^ !(getPileContent pile)^(Char.escaped !currentStack)^") -> ");
    etat:=newEtat;
    pushAll ajoutPile pile;
    if(motChange)then
      if(is_empty mot)then
        currentCarac:=' '
      else
        currentCarac:=pop mot;
    if(is_empty pile)then
      currentStack:=' '
    else
      currentStack:=pop pile;
    print_string ("("^(Char.escaped !etat)^","^ !(getPileContent mot)^(Char.escaped !currentCarac)^","^ !(getPileContent pile)^(Char.escaped !currentStack)^")\n");
    if !currentStack = ' ' || !currentCarac= ' ' then
        endTest()
    else 
      goTrans transition transition
  and
  goTrans trans transition=
    match trans with
      | [] -> print_string "\nEND\n"
      | a::b ->
        match a with
        | (e,None,p1,eArr,p2 ) ->
                                if e = !etat && !currentStack=p1 then 
                                  deplace eArr false p2 transition
                                else goTrans b transition
        | (e,Some(v2),p1,eArr,p2 ) ->
                                  if e = !etat && v2 = !currentCarac && !currentStack = p1 then 
                                  deplace eArr true p2 transition
                                    else
                                    goTrans b transition
  in
  match ast with
  |((inputsymbols, stacksymbols, states, initial_state, initial_stack), transitions ) ->
    etat:= initial_state;
    push (initial_stack) pile;
    pushAll (stringToList mots) mot;
    currentCarac:= (pop mot);
    currentStack:=(pop pile);
    goTrans transitions transitions
;;


let est_valide ast = 
  match ast with
  | ((inputsymbols, stacksymbols, states, initial_state, initial_stack), transitions ) ->
    if not(est_present(initial_state)(states)) then failwith "initial state pas présent dans states";
    if not(est_present(initial_stack)(stacksymbols)) then failwith "initial stack pas présent dans stack symbols";
    if not(check_transition_for_states(states)(transitions)) then failwith "pas deterministe";
    Printf.printf "automate valide selon les critères de l'étape 2\n";
;;

let _=excecute ast mots
let _ = est_valide ast
