%{
open Ast
%}

%token INPUTSYMBOLS LPAREN RPAREN COMMA SEMICOLON STACKSYMBOLS INITIALSTATE STATES INITIALSTACK EOF TRANSITIONS
%token <char> LETTRE

%start<Ast.automate> input

%%

  
input: c=automate EOF { c }

automate: d = declarations t = transitions {(d,t)}

declarations:
	symbols=inputsymbols stacks=stacksymbols st=states init_state=initialstate init_stack=initialstack
				{ ( symbols, stacks, st, init_state, init_stack) }

inputsymbols:
	INPUTSYMBOLS s=suite_lettres_nonvide		{ s }

stacksymbols:
	STACKSYMBOLS s=suite_lettres_nonvide		{ s }

states:
	STATES s=suite_lettres_nonvide				{ s }

initialstate:
	INITIALSTACK l=LETTRE							{ l }

initialstack:
	INITIALSTATE l=LETTRE							{ l }

suite_lettres_nonvide:
	| l=LETTRE									{ [l] }
	| l=LETTRE COMMA s=suite_lettres_nonvide	{ l::s }

transitions:
	TRANSITIONS t=translist						{ t }

translist:
	| 											{ [] }
	| t=transition r=translist					{ t::r }

transition:
    LPAREN
    	l1=LETTRE 			COMMA
    	l2=lettre_ou_vide 	COMMA
    	l3=LETTRE 			COMMA
    	l4=LETTRE 			COMMA
    	s=stack
    RPAREN                						{ (l1,l2,l3,l4,s) }

lettre_ou_vide:
	| 											{ None }
	| l=LETTRE									{ Some l }

stack:
	| 											{ [] }
	|	s=nonemptystack							{ s }

nonemptystack:
	| l=LETTRE									{ [l] }
	| l=LETTRE SEMICOLON s=nonemptystack		{ l::s }
