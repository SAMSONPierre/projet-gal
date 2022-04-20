{
open Token
}

let digit=['0'-'9']
let other=[^'0'-'9']
let lowerLetter=['a'-'z']
let inputsymbols="input symbols : "(lowerLetter as inp1)" , "(lowerLetter as inp2)" , "(lowerLetter as inp3)
    

rule lexeur = parse
        | inputsymbols {INPUTSYMBOLS(inp1,inp2,inp3)}
        | digit as s {DIGIT(s)}
        | other {OTHER}
        | eof {EOF}
        | _  {exit 0}

            
