open Ast 
let lexbuf = Lexing.from_channel stdin 
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

let est_valide ast = 
  match ast with
  | ((inputsymbols, stacksymbols, states, initial_state, initial_stack), transitions ) ->
    if not(est_present(initial_state)(states)) then failwith "initial state pas présent dans states";
    if not(est_present(initial_stack)(stacksymbols)) then failwith "initial stack pas présent dans stack symbols";
    if not(check_transition_for_states(states)(transitions)) then failwith "pas deterministe";
    Printf.printf "automate valide selon les critères de l'étape 2\n";
;;

let _ = est_valide ast