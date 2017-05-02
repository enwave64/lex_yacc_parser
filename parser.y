%{
#include <stdio.h>
%}

%token ID
%token OP
%token EQ
%token SC


%%

assignment: ID EQ expression SC
expression : ID OP ID | expression OP ID

%%
int main() {
yyparse();
return 0;
}
