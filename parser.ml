
type token = 
  | TRANSITIONS
  | STATES
  | STACKSYMBOLS
  | SEMICOLON
  | RPAREN
  | LPAREN
  | LETTRE of (
# 6 "parser.mly"
       (char)
# 13 "parser.ml"
)
  | INPUTSYMBOLS
  | INITIALSTATE
  | INITIALSTACK
  | EOF
  | COMMA

# 1 "parser.mly"
  
open Ast

# 25 "parser.ml"

let menhir_begin_marker =
  0

and (xv_translist, xv_transitions, xv_transition, xv_suite_lettres_nonvide, xv_states, xv_stacksymbols, xv_stack, xv_nonemptystack, xv_lettre_ou_vide, xv_inputsymbols, xv_input, xv_initialstate, xv_initialstack, xv_declarations, xv_automate) =
  let _ = fun (_eRR : exn) (_startpos : Lexing.position) (_endpos : Lexing.position) (_endpos__0_ : Lexing.position) (_symbolstartpos : Lexing.position) (_startofs : int) (_endofs : int) (_endofs__0_ : int) (_symbolstartofs : int) (_sloc : Lexing.position * Lexing.position) (_loc : Lexing.position * Lexing.position) (s : 'tv_translist) (_startpos_s_ : Lexing.position) (_endpos_s_ : Lexing.position) (_startofs_s_ : int) (_endofs_s_ : int) (_loc_s_ : Lexing.position * Lexing.position) (t : 'tv_transition) (_startpos_t_ : Lexing.position) (_endpos_t_ : Lexing.position) (_startofs_t_ : int) (_endofs_t_ : int) (_loc_t_ : Lexing.position * Lexing.position) ->
    (
# 52 "parser.mly"
                                   (t::s)
# 35 "parser.ml"
     : 'tv_translist) in
  let _ = fun (_eRR : exn) (_startpos : Lexing.position) (_endpos : Lexing.position) (_endpos__0_ : Lexing.position) (_symbolstartpos : Lexing.position) (_startofs : int) (_endofs : int) (_endofs__0_ : int) (_symbolstartofs : int) (_sloc : Lexing.position * Lexing.position) (_loc : Lexing.position * Lexing.position) (t : 'tv_transition) (_startpos_t_ : Lexing.position) (_endpos_t_ : Lexing.position) (_startofs_t_ : int) (_endofs_t_ : int) (_loc_t_ : Lexing.position * Lexing.position) ->
    (
# 51 "parser.mly"
                     ([t])
# 41 "parser.ml"
     : 'tv_translist) in
  let _ = fun (_eRR : exn) (_startpos : Lexing.position) (_endpos : Lexing.position) (_endpos__0_ : Lexing.position) (_symbolstartpos : Lexing.position) (_startofs : int) (_endofs : int) (_endofs__0_ : int) (_symbolstartofs : int) (_sloc : Lexing.position * Lexing.position) (_loc : Lexing.position * Lexing.position) (t : 'tv_translist) (_startpos_t_ : Lexing.position) (_endpos_t_ : Lexing.position) (_startofs_t_ : int) (_endofs_t_ : int) (_loc_t_ : Lexing.position * Lexing.position) (_1 : unit) (_startpos__1_ : Lexing.position) (_endpos__1_ : Lexing.position) (_startofs__1_ : int) (_endofs__1_ : int) (_loc__1_ : Lexing.position * Lexing.position) ->
    (
# 48 "parser.mly"
                                     (t)
# 47 "parser.ml"
     : 'tv_transitions) in
  let _ = fun (_eRR : exn) (_startpos : Lexing.position) (_endpos : Lexing.position) (_endpos__0_ : Lexing.position) (_symbolstartpos : Lexing.position) (_startofs : int) (_endofs : int) (_endofs__0_ : int) (_symbolstartofs : int) (_sloc : Lexing.position * Lexing.position) (_loc : Lexing.position * Lexing.position) (_11 : unit) (_startpos__11_ : Lexing.position) (_endpos__11_ : Lexing.position) (_startofs__11_ : int) (_endofs__11_ : int) (_loc__11_ : Lexing.position * Lexing.position) (s : 'tv_stack) (_startpos_s_ : Lexing.position) (_endpos_s_ : Lexing.position) (_startofs_s_ : int) (_endofs_s_ : int) (_loc_s_ : Lexing.position * Lexing.position) (_9 : unit) (_startpos__9_ : Lexing.position) (_endpos__9_ : Lexing.position) (_startofs__9_ : int) (_endofs__9_ : int) (_loc__9_ : Lexing.position * Lexing.position) (l4 : (
# 6 "parser.mly"
       (char)
# 52 "parser.ml"
  )) (_startpos_l4_ : Lexing.position) (_endpos_l4_ : Lexing.position) (_startofs_l4_ : int) (_endofs_l4_ : int) (_loc_l4_ : Lexing.position * Lexing.position) (_7 : unit) (_startpos__7_ : Lexing.position) (_endpos__7_ : Lexing.position) (_startofs__7_ : int) (_endofs__7_ : int) (_loc__7_ : Lexing.position * Lexing.position) (l3 : (
# 6 "parser.mly"
       (char)
# 56 "parser.ml"
  )) (_startpos_l3_ : Lexing.position) (_endpos_l3_ : Lexing.position) (_startofs_l3_ : int) (_endofs_l3_ : int) (_loc_l3_ : Lexing.position * Lexing.position) (_5 : unit) (_startpos__5_ : Lexing.position) (_endpos__5_ : Lexing.position) (_startofs__5_ : int) (_endofs__5_ : int) (_loc__5_ : Lexing.position * Lexing.position) (l2 : 'tv_lettre_ou_vide) (_startpos_l2_ : Lexing.position) (_endpos_l2_ : Lexing.position) (_startofs_l2_ : int) (_endofs_l2_ : int) (_loc_l2_ : Lexing.position * Lexing.position) (_3 : unit) (_startpos__3_ : Lexing.position) (_endpos__3_ : Lexing.position) (_startofs__3_ : int) (_endofs__3_ : int) (_loc__3_ : Lexing.position * Lexing.position) (l1 : (
# 6 "parser.mly"
       (char)
# 60 "parser.ml"
  )) (_startpos_l1_ : Lexing.position) (_endpos_l1_ : Lexing.position) (_startofs_l1_ : int) (_endofs_l1_ : int) (_loc_l1_ : Lexing.position * Lexing.position) (_1 : unit) (_startpos__1_ : Lexing.position) (_endpos__1_ : Lexing.position) (_startofs__1_ : int) (_endofs__1_ : int) (_loc__1_ : Lexing.position * Lexing.position) ->
    (
# 61 "parser.mly"
                     ( (l1,l2,l3,l4,s))
# 65 "parser.ml"
     : 'tv_transition) in
  let _ = fun (_eRR : exn) (_startpos : Lexing.position) (_endpos : Lexing.position) (_endpos__0_ : Lexing.position) (_symbolstartpos : Lexing.position) (_startofs : int) (_endofs : int) (_endofs__0_ : int) (_symbolstartofs : int) (_sloc : Lexing.position * Lexing.position) (_loc : Lexing.position * Lexing.position) (s : 'tv_suite_lettres_nonvide) (_startpos_s_ : Lexing.position) (_endpos_s_ : Lexing.position) (_startofs_s_ : int) (_endofs_s_ : int) (_loc_s_ : Lexing.position * Lexing.position) (_2 : unit) (_startpos__2_ : Lexing.position) (_endpos__2_ : Lexing.position) (_startofs__2_ : int) (_endofs__2_ : int) (_loc__2_ : Lexing.position * Lexing.position) (l : (
# 6 "parser.mly"
       (char)
# 70 "parser.ml"
  )) (_startpos_l_ : Lexing.position) (_endpos_l_ : Lexing.position) (_startofs_l_ : int) (_endofs_l_ : int) (_loc_l_ : Lexing.position * Lexing.position) ->
    (
# 42 "parser.mly"
                                                ( l::s )
# 75 "parser.ml"
     : 'tv_suite_lettres_nonvide) in
  let _ = fun (_eRR : exn) (_startpos : Lexing.position) (_endpos : Lexing.position) (_endpos__0_ : Lexing.position) (_symbolstartpos : Lexing.position) (_startofs : int) (_endofs : int) (_endofs__0_ : int) (_symbolstartofs : int) (_sloc : Lexing.position * Lexing.position) (_loc : Lexing.position * Lexing.position) (l : (
# 6 "parser.mly"
       (char)
# 80 "parser.ml"
  )) (_startpos_l_ : Lexing.position) (_endpos_l_ : Lexing.position) (_startofs_l_ : int) (_endofs_l_ : int) (_loc_l_ : Lexing.position * Lexing.position) ->
    (
# 41 "parser.mly"
                                                  ( [l] )
# 85 "parser.ml"
     : 'tv_suite_lettres_nonvide) in
  let _ = fun (_eRR : exn) (_startpos : Lexing.position) (_endpos : Lexing.position) (_endpos__0_ : Lexing.position) (_symbolstartpos : Lexing.position) (_startofs : int) (_endofs : int) (_endofs__0_ : int) (_symbolstartofs : int) (_sloc : Lexing.position * Lexing.position) (_loc : Lexing.position * Lexing.position) (s : 'tv_suite_lettres_nonvide) (_startpos_s_ : Lexing.position) (_endpos_s_ : Lexing.position) (_startofs_s_ : int) (_endofs_s_ : int) (_loc_s_ : Lexing.position * Lexing.position) (_1 : unit) (_startpos__1_ : Lexing.position) (_endpos__1_ : Lexing.position) (_startofs__1_ : int) (_endofs__1_ : int) (_loc__1_ : Lexing.position * Lexing.position) ->
    (
# 32 "parser.mly"
                                     (s)
# 91 "parser.ml"
     : 'tv_states) in
  let _ = fun (_eRR : exn) (_startpos : Lexing.position) (_endpos : Lexing.position) (_endpos__0_ : Lexing.position) (_symbolstartpos : Lexing.position) (_startofs : int) (_endofs : int) (_endofs__0_ : int) (_symbolstartofs : int) (_sloc : Lexing.position * Lexing.position) (_loc : Lexing.position * Lexing.position) (s : 'tv_suite_lettres_nonvide) (_startpos_s_ : Lexing.position) (_endpos_s_ : Lexing.position) (_startofs_s_ : int) (_endofs_s_ : int) (_loc_s_ : Lexing.position * Lexing.position) (_1 : unit) (_startpos__1_ : Lexing.position) (_endpos__1_ : Lexing.position) (_startofs__1_ : int) (_endofs__1_ : int) (_loc__1_ : Lexing.position * Lexing.position) ->
    (
# 29 "parser.mly"
                                                (s)
# 97 "parser.ml"
     : 'tv_stacksymbols) in
  let _ = fun (_eRR : exn) (_startpos : Lexing.position) (_endpos : Lexing.position) (_endpos__0_ : Lexing.position) (_symbolstartpos : Lexing.position) (_startofs : int) (_endofs : int) (_endofs__0_ : int) (_symbolstartofs : int) (_sloc : Lexing.position * Lexing.position) (_loc : Lexing.position * Lexing.position) (l : 'tv_nonemptystack) (_startpos_l_ : Lexing.position) (_endpos_l_ : Lexing.position) (_startofs_l_ : int) (_endofs_l_ : int) (_loc_l_ : Lexing.position * Lexing.position) ->
    (
# 65 "parser.mly"
                      (Some l)
# 103 "parser.ml"
     : 'tv_stack) in
  let _ = fun (_eRR : exn) (_startpos : Lexing.position) (_endpos : Lexing.position) (_endpos__0_ : Lexing.position) (_symbolstartpos : Lexing.position) (_startofs : int) (_endofs : int) (_endofs__0_ : int) (_symbolstartofs : int) (_sloc : Lexing.position * Lexing.position) (_loc : Lexing.position * Lexing.position) ->
    (
# 64 "parser.mly"
      (None)
# 109 "parser.ml"
     : 'tv_stack) in
  let _ = fun (_eRR : exn) (_startpos : Lexing.position) (_endpos : Lexing.position) (_endpos__0_ : Lexing.position) (_symbolstartpos : Lexing.position) (_startofs : int) (_endofs : int) (_endofs__0_ : int) (_symbolstartofs : int) (_sloc : Lexing.position * Lexing.position) (_loc : Lexing.position * Lexing.position) (s : 'tv_nonemptystack) (_startpos_s_ : Lexing.position) (_endpos_s_ : Lexing.position) (_startofs_s_ : int) (_endofs_s_ : int) (_loc_s_ : Lexing.position * Lexing.position) (_2 : unit) (_startpos__2_ : Lexing.position) (_endpos__2_ : Lexing.position) (_startofs__2_ : int) (_endofs__2_ : int) (_loc__2_ : Lexing.position * Lexing.position) (l : (
# 6 "parser.mly"
       (char)
# 114 "parser.ml"
  )) (_startpos_l_ : Lexing.position) (_endpos_l_ : Lexing.position) (_startofs_l_ : int) (_endofs_l_ : int) (_loc_l_ : Lexing.position * Lexing.position) ->
    (
# 69 "parser.mly"
                                         (l::s)
# 119 "parser.ml"
     : 'tv_nonemptystack) in
  let _ = fun (_eRR : exn) (_startpos : Lexing.position) (_endpos : Lexing.position) (_endpos__0_ : Lexing.position) (_symbolstartpos : Lexing.position) (_startofs : int) (_endofs : int) (_endofs__0_ : int) (_symbolstartofs : int) (_sloc : Lexing.position * Lexing.position) (_loc : Lexing.position * Lexing.position) (l : (
# 6 "parser.mly"
       (char)
# 124 "parser.ml"
  )) (_startpos_l_ : Lexing.position) (_endpos_l_ : Lexing.position) (_startofs_l_ : int) (_endofs_l_ : int) (_loc_l_ : Lexing.position * Lexing.position) ->
    (
# 68 "parser.mly"
               ([l])
# 129 "parser.ml"
     : 'tv_nonemptystack) in
  let _ = fun (_eRR : exn) (_startpos : Lexing.position) (_endpos : Lexing.position) (_endpos__0_ : Lexing.position) (_symbolstartpos : Lexing.position) (_startofs : int) (_endofs : int) (_endofs__0_ : int) (_symbolstartofs : int) (_sloc : Lexing.position * Lexing.position) (_loc : Lexing.position * Lexing.position) (l : (
# 6 "parser.mly"
       (char)
# 134 "parser.ml"
  )) (_startpos_l_ : Lexing.position) (_endpos_l_ : Lexing.position) (_startofs_l_ : int) (_endofs_l_ : int) (_loc_l_ : Lexing.position * Lexing.position) ->
    (
# 46 "parser.mly"
                 ( Some l)
# 139 "parser.ml"
     : 'tv_lettre_ou_vide) in
  let _ = fun (_eRR : exn) (_startpos : Lexing.position) (_endpos : Lexing.position) (_endpos__0_ : Lexing.position) (_symbolstartpos : Lexing.position) (_startofs : int) (_endofs : int) (_endofs__0_ : int) (_symbolstartofs : int) (_sloc : Lexing.position * Lexing.position) (_loc : Lexing.position * Lexing.position) ->
    (
# 45 "parser.mly"
        (None)
# 145 "parser.ml"
     : 'tv_lettre_ou_vide) in
  let _ = fun (_eRR : exn) (_startpos : Lexing.position) (_endpos : Lexing.position) (_endpos__0_ : Lexing.position) (_symbolstartpos : Lexing.position) (_startofs : int) (_endofs : int) (_endofs__0_ : int) (_symbolstartofs : int) (_sloc : Lexing.position * Lexing.position) (_loc : Lexing.position * Lexing.position) (s : 'tv_suite_lettres_nonvide) (_startpos_s_ : Lexing.position) (_endpos_s_ : Lexing.position) (_startofs_s_ : int) (_endofs_s_ : int) (_loc_s_ : Lexing.position * Lexing.position) (_1 : unit) (_startpos__1_ : Lexing.position) (_endpos__1_ : Lexing.position) (_startofs__1_ : int) (_endofs__1_ : int) (_loc__1_ : Lexing.position * Lexing.position) ->
    (
# 26 "parser.mly"
                                           (s)
# 151 "parser.ml"
     : 'tv_inputsymbols) in
  let _ = fun (_eRR : exn) (_startpos : Lexing.position) (_endpos : Lexing.position) (_endpos__0_ : Lexing.position) (_symbolstartpos : Lexing.position) (_startofs : int) (_endofs : int) (_endofs__0_ : int) (_symbolstartofs : int) (_sloc : Lexing.position * Lexing.position) (_loc : Lexing.position * Lexing.position) (_2 : unit) (_startpos__2_ : Lexing.position) (_endpos__2_ : Lexing.position) (_startofs__2_ : int) (_endofs__2_ : int) (_loc__2_ : Lexing.position * Lexing.position) (c : 'tv_automate) (_startpos_c_ : Lexing.position) (_endpos_c_ : Lexing.position) (_startofs_c_ : int) (_endofs_c_ : int) (_loc_c_ : Lexing.position * Lexing.position) ->
    (
# 13 "parser.mly"
                      ( c )
# 157 "parser.ml"
     : (
# 8 "parser.mly"
      (Ast.automate)
# 161 "parser.ml"
    )) in
  let _ = fun (_eRR : exn) (_startpos : Lexing.position) (_endpos : Lexing.position) (_endpos__0_ : Lexing.position) (_symbolstartpos : Lexing.position) (_startofs : int) (_endofs : int) (_endofs__0_ : int) (_symbolstartofs : int) (_sloc : Lexing.position * Lexing.position) (_loc : Lexing.position * Lexing.position) (s : (
# 6 "parser.mly"
       (char)
# 166 "parser.ml"
  )) (_startpos_s_ : Lexing.position) (_endpos_s_ : Lexing.position) (_startofs_s_ : int) (_endofs_s_ : int) (_loc_s_ : Lexing.position * Lexing.position) (_1 : unit) (_startpos__1_ : Lexing.position) (_endpos__1_ : Lexing.position) (_startofs__1_ : int) (_endofs__1_ : int) (_loc__1_ : Lexing.position * Lexing.position) ->
    (
# 35 "parser.mly"
                            (s)
# 171 "parser.ml"
     : 'tv_initialstate) in
  let _ = fun (_eRR : exn) (_startpos : Lexing.position) (_endpos : Lexing.position) (_endpos__0_ : Lexing.position) (_symbolstartpos : Lexing.position) (_startofs : int) (_endofs : int) (_endofs__0_ : int) (_symbolstartofs : int) (_sloc : Lexing.position * Lexing.position) (_loc : Lexing.position * Lexing.position) (s : (
# 6 "parser.mly"
       (char)
# 176 "parser.ml"
  )) (_startpos_s_ : Lexing.position) (_endpos_s_ : Lexing.position) (_startofs_s_ : int) (_endofs_s_ : int) (_loc_s_ : Lexing.position * Lexing.position) (_1 : unit) (_startpos__1_ : Lexing.position) (_endpos__1_ : Lexing.position) (_startofs__1_ : int) (_endofs__1_ : int) (_loc__1_ : Lexing.position * Lexing.position) ->
    (
# 38 "parser.mly"
                            (s)
# 181 "parser.ml"
     : 'tv_initialstack) in
  let _ = fun (_eRR : exn) (_startpos : Lexing.position) (_endpos : Lexing.position) (_endpos__0_ : Lexing.position) (_symbolstartpos : Lexing.position) (_startofs : int) (_endofs : int) (_endofs__0_ : int) (_symbolstartofs : int) (_sloc : Lexing.position * Lexing.position) (_loc : Lexing.position * Lexing.position) (s5 : 'tv_initialstack) (_startpos_s5_ : Lexing.position) (_endpos_s5_ : Lexing.position) (_startofs_s5_ : int) (_endofs_s5_ : int) (_loc_s5_ : Lexing.position * Lexing.position) (_9 : unit) (_startpos__9_ : Lexing.position) (_endpos__9_ : Lexing.position) (_startofs__9_ : int) (_endofs__9_ : int) (_loc__9_ : Lexing.position * Lexing.position) (s4 : 'tv_initialstate) (_startpos_s4_ : Lexing.position) (_endpos_s4_ : Lexing.position) (_startofs_s4_ : int) (_endofs_s4_ : int) (_loc_s4_ : Lexing.position * Lexing.position) (_7 : unit) (_startpos__7_ : Lexing.position) (_endpos__7_ : Lexing.position) (_startofs__7_ : int) (_endofs__7_ : int) (_loc__7_ : Lexing.position * Lexing.position) (s3 : 'tv_states) (_startpos_s3_ : Lexing.position) (_endpos_s3_ : Lexing.position) (_startofs_s3_ : int) (_endofs_s3_ : int) (_loc_s3_ : Lexing.position * Lexing.position) (_5 : unit) (_startpos__5_ : Lexing.position) (_endpos__5_ : Lexing.position) (_startofs__5_ : int) (_endofs__5_ : int) (_loc__5_ : Lexing.position * Lexing.position) (s2 : 'tv_stacksymbols) (_startpos_s2_ : Lexing.position) (_endpos_s2_ : Lexing.position) (_startofs_s2_ : int) (_endofs_s2_ : int) (_loc_s2_ : Lexing.position * Lexing.position) (_3 : unit) (_startpos__3_ : Lexing.position) (_endpos__3_ : Lexing.position) (_startofs__3_ : int) (_endofs__3_ : int) (_loc__3_ : Lexing.position * Lexing.position) (s1 : 'tv_inputsymbols) (_startpos_s1_ : Lexing.position) (_endpos_s1_ : Lexing.position) (_startofs_s1_ : int) (_endofs_s1_ : int) (_loc_s1_ : Lexing.position * Lexing.position) (_1 : unit) (_startpos__1_ : Lexing.position) (_endpos__1_ : Lexing.position) (_startofs__1_ : int) (_endofs__1_ : int) (_loc__1_ : Lexing.position * Lexing.position) ->
    (
# 23 "parser.mly"
    (s1,s2,s3,s4,s5)
# 187 "parser.ml"
     : 'tv_declarations) in
  let _ = fun (_eRR : exn) (_startpos : Lexing.position) (_endpos : Lexing.position) (_endpos__0_ : Lexing.position) (_symbolstartpos : Lexing.position) (_startofs : int) (_endofs : int) (_endofs__0_ : int) (_symbolstartofs : int) (_sloc : Lexing.position * Lexing.position) (_loc : Lexing.position * Lexing.position) (c : 'tv_transitions) (_startpos_c_ : Lexing.position) (_endpos_c_ : Lexing.position) (_startofs_c_ : int) (_endofs_c_ : int) (_loc_c_ : Lexing.position * Lexing.position) (d : 'tv_declarations) (_startpos_d_ : Lexing.position) (_endpos_d_ : Lexing.position) (_startofs_d_ : int) (_endofs_d_ : int) (_loc_d_ : Lexing.position * Lexing.position) ->
    (
# 15 "parser.mly"
                                           (d,c)
# 193 "parser.ml"
     : 'tv_automate) in
  (raise Not_found : 'tv_translist * 'tv_transitions * 'tv_transition * 'tv_suite_lettres_nonvide * 'tv_states * 'tv_stacksymbols * 'tv_stack * 'tv_nonemptystack * 'tv_lettre_ou_vide * 'tv_inputsymbols * (
# 8 "parser.mly"
      (Ast.automate)
# 198 "parser.ml"
  ) * 'tv_initialstate * 'tv_initialstack * 'tv_declarations * 'tv_automate)

and menhir_end_marker =
  0

# 269 "<standard.mly>"
  

# 207 "parser.ml"
