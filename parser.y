/*parser.y */
%{
#include <stdio.h>
%}

%token ID
%token OP
%token EQ
%token SC

%%
start: expression '\n' {printf("  is an expression\n");return 0;} |
        assignment '\n' {printf(" is an assignment\n");return 0;}

expression: expression OP ID | ID OP ID;
assignment: ID EQ expression SC;

%%
int yywrap(){
return 1;
}

yyerror(s)
char *s;
{printf("%s, it is not in expression\n", s);
}

int main(){
yyparse();
return 0;
}
