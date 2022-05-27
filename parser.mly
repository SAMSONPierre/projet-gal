/*

— automate → declarations transitions
— declarations → inputsymbols stacksymbols states initialstate initialstack
— inputsymbols → input symbols: suitelettres-nonvide
— stacksymbols → stack symbols: suitelettres-nonvide
— states → states: suitelettres-nonvide
— initialstate → initial state: lettre
— initialstack → initial stack symbol: lettre
— suitelettres-nonvide → lettre | lettre , suitelettres-nonvide
— transitions → transitions: translist
— translist → epsilon | transition translist
— transition → ( lettre , lettre-ou-vide , lettre , lettre , stack )
— lettre-ou-vide → epsilon | lettre
— stack → epsilon | nonemptystack
— nonemptystack → lettre | lettre ; nonemptystack

*/

%{
open Ast
%}

%token COMMA SEMICOLON LPAREN RPAREN INITIAL_STATE INITIAL_STACK INPUT_SYMBOLS STACK_SYMBOLS STATES TRANSITIONS EOF
%token <char> LETTRE

%start<Ast.automate> input

%%

input:
	c=automate EOF {c}

automate:
	d=declarations t=transitions 			{(d,t)}

declarations:
	symbols=input_symbols 
	stacks=stack_symbols 
	states=states 
	initial_state=initial_state 
	initial_stack=initial_stack
				
	{(symbols, stacks, states, initial_state, initial_stack)}

input_symbols:
	INPUT_SYMBOLS s= suite_lettres_nonvide		{s}

stack_symbols:
	STACK_SYMBOLS s= suite_lettres_nonvide		{s}

states:
	STATES s= suite_lettres_nonvide				{s}

initial_state:
	INITIAL_STATE l=LETTRE							{l}

initial_stack:
	INITIAL_STACK l=LETTRE							{l}

suite_lettres_nonvide: l=LETTRE									{[l]}
	| l=LETTRE COMMA s=suite_lettres_nonvide	{l::s}

transitions:
	TRANSITIONS t=translist						{t}

translist:
	| 											{[]}
	| t=transition r=translist					{t::r}

transition:
    LPAREN
    	l1=LETTRE 			COMMA
    	l2=lettre_ou_vide 	COMMA
    	l3=LETTRE 			COMMA
    	l4=LETTRE 			COMMA
    	s=stack
    RPAREN                						{(l1,l2,l3,l4,s)}

lettre_ou_vide: {None}
	| l=LETTRE									{Some l}

stack: { [] }
	|	s=nonemptystack							{s}

nonemptystack: l=LETTRE									{[l]}
	| l=LETTRE SEMICOLON s=nonemptystack		{l::s}
