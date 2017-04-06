%token LEFT_PAREN
%token RIGHT_PAREN
%token S
%token K
%token I
%token EOF

%start <Ast.expr> expr
%%

expr:
  | xs = list(inner_expr); EOF { Ast.Tree xs }
  | EOF { Ast.Tree [] }
  ;

inner_expr:
  | K { Ast.Op Ast.K }
  | S { Ast.Op Ast.S }
  | I { Ast.Op Ast.I }
  | LEFT_PAREN; xs = list(inner_expr); RIGHT_PAREN { Ast.Tree xs }
  ;
