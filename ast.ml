type initialstate = char

type suite_lettres_nonvide = char list

type inputsymbols = suite_lettres_nonvide

type stacksymbols = suite_lettres_nonvide

type states = suite_lettres_nonvide

type initialstack = char

type nonemptystack = char list

type lettre_ou_vide =
  | Vide of (char option)
  | Lettre of char

type stack = 
  | Var of lettre_ou_vide
  | Liste of nonemptystack

type transition = char * (char option) * char * char * (char list) 

type translist = 
  | Vide of transition
  | Liste of transition list

type transitions = translist

type declarations = inputsymbols * stacksymbols * states * initialstate * initialstack

type automate = declarations * transitions





  
