open Ast
let mots=Array.get Sys.argv 1
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
open Stack;;



let stringToList str = List.init (String.length str) (String.get str);;
let excecute ast mot=
  let mot =create() in
  let etat = ref ' ' in
  let pile = create() in
  let rec pushAll lis pi=
    match lis with 
    |x::y->push x pi;pushAll y pi 
    |[]->()
  in
  let rec goTrans trans=
    match trans with
      | [] -> print_string "end"
      | a::b ->
        match a with
        | (e,None,p1,eArr,p2 ) ->if e = !etat then 
                                  etat := eArr;

        | (e,Some(v2),p1,eArr,p2 ) ->if e = !etat then print_string "on"
        ;goTrans b
  in
  match ast with
  |((inputsymbols, stacksymbols, states, initial_state, initial_stack), transitions ) ->
    etat:= initial_state;
    push (initial_stack) pile;
    pushAll (stringToList mots) mot;
    goTrans transitions
;;



let est_valide ast = 
  match ast with
  | ((inputsymbols, stacksymbols, states, initial_state, initial_stack), transitions ) ->
    if not(est_present(initial_state)(states)) then failwith "initial state pas présent dans states";
    if not(est_present(initial_stack)(stacksymbols)) then failwith "initial stack pas présent dans stack symbols";
;;

let _ = est_valide ast;;
let _=excecute ast mots;;
