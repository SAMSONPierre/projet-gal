{
open Parser
}

let layout = [ ' ' '\t' '\n' ]
let lettre = [ 'a'-'z''A'-'Z''1'-'9' ]

rule main = parse
    | layout    { main lexbuf }
    | "input symbols :"     { INPUTSYMBOLS }
    | lettre as l { LETTRE l}
    | "stack symbols :" {STACKSYMBOLS}
    | "initial state :" {INITIALSTATE}
    | "states :" {STATES}
    | "initial stack symbol :" { INITIALSTACK}
    | "transitions :" {TRANSITIONS}
    | ')'			{ RPAREN }
    | '('			{ LPAREN }
    | ','           { COMMA }
    | ';'           { SEMICOLON }
    | eof { EOF }
    | _	 { failwith "unexpected character" }