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

rule token = parse
  ws+                           { token lexbuf }
| '\n'                          { newline lexbuf; token lexbuf }
| _ as c                        { fail lexbuf ("Illegal -> '" ^ (Char.escaped c) ^ "'") }
| eof                           { EOF }
