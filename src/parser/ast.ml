type assign_op =
    AssignEq (* = *)
  | AddEq    (* += *)
  | SubEq    (* -= *)
  | MultEq   (* *= *)
  | DivEq    (* /= *)

let assign_op_str = function
  | AssignEq -> "="
  | AddEq -> "+="
  | SubEq -> "-="
  | MultEq -> "*="
  | DivEq -> "/="

type unop = Plus | Minus | Not

type binop =
  | Add
  | Sub
  | Mult
  | Div
  | Mod
  | Lt
  | Gt
  | Lte
  | Gte
  | Nee (* Not equal equal: != *)
  | Ee (* Equal equal: == *)
  | And
  | Or

let binop_str = function
  | Add -> "+"
  | Sub -> "-"
  | Mult -> "*"
  | Div -> "/"
  | Mod -> "%"
  | Lt -> "<"
  | Gt -> ">"
  | Lte -> "<="
  | Gte -> ">="
  | Nee -> "!="
  | Ee -> "=="
  | And -> "&&"
  | Or -> "||"

let unop_str = function
  | Plus -> "+"
  | Minus -> "-"
  | Not -> "!"

type type_def =
    StringType
  | NumberType
  | ConstType of type_def
  | PointerType of type_def

let rec type_def_str = function
    StringType -> "StringType"
  | NumberType -> "NumberType"
  | ConstType x -> "ConstType " ^ type_def_str x
  | PointerType x -> "PointerType " ^ type_def_str x

type literal =
    String of string
  | Number of float

let literal_str = function
    String s -> "\"" ^ s ^ "\""
  | Number x -> string_of_float x
