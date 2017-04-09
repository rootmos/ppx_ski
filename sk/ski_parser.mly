%token LEFT_PAREN
%token RIGHT_PAREN
%token S
%token K
%token I
%token <string> ATOM
%token <string> COMBINATOR
%token EOF

%start <Sk_ast.expr> expr
%%

expr:
  | t = inner_expr; EOF { t }
  | xs = list(inner_expr); EOF { Sk_ast.Tree xs }
  | EOF { Sk_ast.Tree [] }
  ;

inner_expr:
  | K { Sk_ast.K }
  | S { Sk_ast.S }
  | I { Sk_ast.Tree [Sk_ast.S; Sk_ast.K; Sk_ast.K] }
  | s = ATOM { Sk_ast.Atom s }
  | c = COMBINATOR { Sk_ast.Combinator c }
  | LEFT_PAREN; xs = list(inner_expr); RIGHT_PAREN { Sk_ast.Tree xs }
  ;
