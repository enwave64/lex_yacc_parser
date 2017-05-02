%{
#include <stdio.h>
%}

%token ID
%token OP
%token EQ
%token SC
%%
ass : ID EQ exp SC { printf("Assignment\n"); }

exp :  ID OP ID { printf("Expression\n"); }
    |  exp OP ID 

expbrace : ( ID OP ID SC ) { printf("Expression brace\n");}


%%
#include "lex.yy.c"

int main() {
    yyparse();
    return 0;
}
