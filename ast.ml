type lettre = char list

type transition = char * (char option) * char * char * lettre

type transitions = transition list

type declarations = lettre * lettre * lettre * char * char

type automate = declarations * transitions





    


(*
open Stack;;
let getDeclaration d=
  match d with
  |(s1, s2, s3, s4, s5) ->

let rec verifTranstions t=
  | [] -> ""
  | h::q ->match h with
          |(v1,None,v3,v4,stack )->
          |(v1,Some(v2),v3,v4,stack )->
  
let verif ast=
  match ast with
  | (d, t) -> 
*)

let as_string ast : string = 
  let rec print_list l sep = match l with
  | [] -> ""
  | h::[] -> Printf.sprintf "%c" h
  | h::q -> Printf.sprintf "%c %s %s" h sep ((print_list q sep)) in

  let print_transi t =  match t with
  | (v1,None,v3,v4,stack ) -> Printf.sprintf "(%c, , %c, %c, %s)" v1 v3 v4 ((print_list stack ";" ))
  | (v1,Some(v2),v3,v4,stack ) -> Printf.sprintf "(%c, %c, %c, %c, %s)" v1 v2 v3 v4 ((print_list stack ";" )) in

  let rec print_transitions l = match l with
  | [] -> ""
  | h::q -> (print_transi h) ^ "\n" ^ (print_transitions q) in

  let print_declarations d : string = 
    match d with
    | (s1, s2, s3, s4, s5) ->Printf.sprintf "input symbols: %s\nstack symbols: %s\nstates: %s\ninitial state: %c\ninitial stack symbol: %c\n"
      (print_list s1 ",") (print_list s2 ",") (print_list s3 ",") s4 s5 in
  match ast with
 	| (d, t) -> print_declarations d ^ "transitions: \n" ^ print_transitions t
















let as_string ast : string = 

  let rec print_list l sep = match l with
  | [] -> ""
  | h::[] -> Printf.sprintf "%c" h
  | h::q -> Printf.sprintf "%c %s %s" h sep ((print_list q sep)) in

  let print_transi t =  match t with
  | (v1,None,v3,v4,stack ) -> Printf.sprintf "(%c, , %c, %c, %s)" v1 v3 v4 ((print_list stack ";" ))
  | (v1,Some(v2),v3,v4,stack ) -> Printf.sprintf "(%c, %c, %c, %c, %s)" v1 v2 v3 v4 ((print_list stack ";" )) in

  let rec print_transitions l = match l with
  | [] -> ""
  | h::q -> (print_transi h) ^ "\n" ^ (print_transitions q) in

  let print_declarations d : string = 
    match d with
    | (s1, s2, s3, s4, s5) ->Printf.sprintf "input symbols: %s\nstack symbols: %s\nstates: %s\ninitial state: %c\ninitial stack symbol: %c\n"
      (print_list s1 ",") (print_list s2 ",") (print_list s3 ",") s4 s5 in
  match ast with
 	| (d, t) -> print_declarations d ^ "transitions: \n" ^ print_transitions t;;