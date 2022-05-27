{
open Parser
}

let layout = [ ' ' '\t' '\n' ]
let lettre = [ 'a'-'z''A'-'Z''1'-'9' ]

rule main = parse
    | layout    { main lexbuf }
    | "input symbols:"     { INPUT_SYMBOLS }
    | lettre as l { LETTRE l}
    | "stack symbols:" {STACK_SYMBOLS}
    | "initial state:" {INITIAL_STATE}
    | "states:" {STATES}
    | "initial stack symbol:" { INITIAL_STACK}
    | "transitions:" {TRANSITIONS}
    | ')'			{ RPAREN }
    | '('			{ LPAREN }
    | ','           { COMMA }
    | ';'           { SEMICOLON }
    | eof { EOF }
    | _	 { failwith "unexpected character" }