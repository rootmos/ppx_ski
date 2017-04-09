%token LEFT_PAREN
%token RIGHT_PAREN
%token S
%token K
%token I
%token <string> ATOM
%token EOF

%start <Ast.expr> expr
%%

expr:
  | t = inner_expr; EOF { t }
  | xs = list(inner_expr); EOF { Ast.Tree xs }
  | EOF { Ast.Tree [] }
  ;

inner_expr:
  | K { Ast.K }
  | S { Ast.S }
  | I { Ast.Tree [Ast.S; Ast.K; Ast.K] }
  | s = ATOM { Ast.Atom s }
  | LEFT_PAREN; xs = list(inner_expr); RIGHT_PAREN { Ast.Tree xs }
  ;
