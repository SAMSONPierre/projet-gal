{
open Token
}

let next=['0'-'9']*[^'0'-'9']
let digit=['0'-'9']
let other=[^'0'-'9']
let lowerLetter=['a'-'z']
let text=(", "?*['a'-'z''A'-'Z'])*
let intText=(", "?*['0'-'9'])*

let etape=(['\n']?*"("['a'-'z''A'-'Z'' '';''1'-'9'',']*")")*

let return=['\n']
let nimport=(['a''-''z'',''A''-''Z'';''('')'' '':'])*

let verification =      ("input symbols : "(text as input)(return)
                        "stack symbols : "(text as stack)(return)
                        "states : "(intText as state)(return)
                        "initial state : "(intText as initState)(return)
                        "intial stack symbol : "(text as initStack)(return)
                        "transitions :"(etape as trans))
let next = (next as mot)

rule lexeur = parse
        | verification {VERIF(input,stack,state,initState,initStack,trans)}
        | next {NEXT(mot)}
        | eof {EOF}
        | _  {exit 0}
