{
open Token
}

let digit=['0'-'9']
let other=[^'0'-'9']
let lowerLetter=['a'-'z']
let text=(", "?*['a'-'z''A'-'Z'])*
let intText=(", "?*['0'-'9'])*
let etape=(['a'-'z''A'-'Z'' '';''1'-'9''('')'',''\n']*)*
let return=['\n']
let nimport=(['a''-''z'',''A''-''Z'';''('')'' '':'])*

let inputsymbols="input symbols : "(text as input)
let stacksymbols="stack symbols : "(text as stack)
let states="states : "(intText as state)
let initialstate ="initial state : "(intText as initState)
let initialstack ="intial stack symbol : "(text as initStack)
let transition = "transitions :"(etape as trans)


rule lexeur = parse
        | transition {TRANSITION(trans)}
        | inputsymbols {INPUTSYMBOLS(input)}
        | stacksymbols {STACKSYMBOLS(stack)}
        | states {STATES(state)}
        | initialstate {INITIALSTATE(initState)}
        | initialstack {INITIALSTACK(initStack)}
        | digit as s {DIGIT(s)}
        | other {OTHER}
        | eof {EOF}
        | _  {exit 0}
