%{
open Ast
%}

%token INPUTSYMBOLS LPAREN RPAREN COMMA SEMICOLON STACKSYMBOLS INITIALSTATE STATES INITIALSTACK EOF TRANSITIONS
%token <char> LETTRE

%start<Ast.automate> input

%%

  
input: c=automate EOF { c }

automate: d = declarations c = transitions {d,c}

declarations: 
    INPUTSYMBOLS s1=inputsymbols
    STACKSYMBOLS s2= stacksymbols
    STATES s3=states
    INITIALSTATE s4=initialstate
    INITIALSTACK s5=initialstack
    {s1,s2,s3,s4,s5}

inputsymbols:
    INPUTSYMBOLS s = suite_lettres_nonvide {s}

stacksymbols:
    STACKSYMBOLS s=suite_lettres_nonvide {s}

states:
    STATES s = suite_lettres_nonvide {s}

initialstate:
    INITIALSTATE l = LETTRE {l}

initialstack:
    INITIALSTACK l = LETTRE {l}

suite_lettres_nonvide:
    | l=LETTRE                                    { [l] }
    | l=LETTRE COMMA s=suite_lettres_nonvide    { l::s }

lettre_ou_vide:
    |            {None}
    | l = LETTRE { Some l}

transitions: TRANSITIONS t=translist {t}

translist:
    |       {[]}
    | t=transition s = translist {t::s}

transition:
    LPAREN
        l1=LETTRE             COMMA
        l2=lettre_ou_vide     COMMA
        l3=LETTRE             COMMA
        l4=LETTRE             COMMA
        s=stack
    RPAREN           { (l1,l2,l3,l4,s)}

stack:
    | {[]}
    | s=nonemptystack {s}

nonemptystack:
    | l=LETTRE {[l]}
    | l=LETTRE SEMICOLON s=nonemptystack {l::s}