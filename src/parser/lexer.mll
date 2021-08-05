{
  open Parser;;

  exception Lex_error of (string * (string * int * int))
  ;;

  let fail lexbuf s =
    let sp = lexbuf.Lexing.lex_start_p in
    let pos =
      (
        sp.Lexing.pos_fname,
        sp.Lexing.pos_lnum,
        (sp.Lexing.pos_cnum - sp.Lexing.pos_bol)
      )
    in raise (Lex_error (s, pos))
  ;;
  
  let newline lexbuf =
    let pos = lexbuf.Lexing.lex_curr_p in
    lexbuf.Lexing.lex_curr_p <-
      {
        pos with pos_bol = pos.pos_cnum;
        pos_lnum = pos.pos_lnum + 1
      }
  ;;

  let keyword_tbl = Hashtbl.create 100
  let _ =
    List.iter (fun (kwd, tok) -> Hashtbl.add keyword_tbl kwd tok)
            [
              ("function", FUNCTION);

              (* Types *)
              ("string", STRING_KW);
              ("number", NUMBER_KW);
              
              (* IO statements *)
              ("print", PRINT);
              ("println", PRINTLN);
              ("read", READ);
              ("readline", READLINE)
            ]
  ;;
}

let ws = [' ' '\t' '\r' ]

let digit = ['0'-'9' ]
let frac = '.' digit*
let exp = ['e' 'E' ] ['-' '+' ]? digit+
let number = digit* frac? exp?

let id = ['a'-'z' 'A'-'Z' '_'] ['a'-'z' 'A'-'Z' '0'-'9' '_']*

rule token = parse
  ws+                           { token lexbuf }
| '\n'                          { newline lexbuf; token lexbuf }
| '$' id                        { VAR_IDENTIFIER (Lexing.lexeme lexbuf) }
| id as i                       { match Hashtbl.find_opt keyword_tbl i with Some tok -> tok | None -> IDENTIFIER i }
| number                        { NUMBER (float_of_string (Lexing.lexeme lexbuf)) }
| "true"                        { NUMBER 1 }
| "false"                       { NUMBER 0 }
| "null"                        { NUMBER 0 }
| '+'                           { PLUS }
| '-'                           { MINUS }
| '*'                           { MULTIPLY }
| '/'                           { DIVIDE }
| '='                           { EQ }
| '<'                           { LT }
| '>'                           { GT }
| "=="                          { EE }
| "!="                          { NEE }
| "<="                          { LTE }
| ">="                          { GTE }
| '!'                           { NOT }
| ';'                           { SEMI }
| '$'                           { fail lexbuf ("Illegal -> '" ^ (Char.escaped c) ^ "'\nNote: When making variables, you have to put a $ together with the identifier, no whitespace, wrong: '$ var', right: '$var'") }
| _ as c                        { fail lexbuf ("Illegal -> '" ^ (Char.escaped c) ^ "'") }
| eof                           { EOF }
