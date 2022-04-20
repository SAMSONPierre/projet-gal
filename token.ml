
type token =
  | INPUTSYMBOLS of string
  | STACKSYMBOLS of string
  | STATES of string
  | INITIALSTATE of string
  | INITIALSTACK of string 
  | DIGIT of char
  | OTHER 
  | EOF



