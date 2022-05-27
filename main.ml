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

(* TODO :    
  Première partie : faire la gestion des erreurs 
    — il n’y a aucune transition qui s’applique ;
    — l’entrée est épuisée sans que la pile soit vide ;
    — la pile est vide sans que l’entrée soit épuisée.
  Deuxième partie : vérifier que l'automate est déterministe dans est_valide
*)

let est_valide ast = 
  match ast with
  | ((inputsymbols, stacksymbols, states, initial_state, initial_stack), transitions ) ->
    if not(est_present(initial_state)(states)) then failwith "initial state pas présent dans states";
    if not(est_present(initial_stack)(stacksymbols)) then failwith "initial stack pas présent dans stack symbols";
;;


let _ = est_valide ast
