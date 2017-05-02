/*parser.y */
%{
#include <stdio.h>
FILE *yyin;
%}

%token ID
%token OP
%token EQ
%token SC

%%
start: expression '\n' {printf("  Expression\n");return 0;} |
        assignment '\n' {printf(" Assignment\n");return 0;}

expression: expression OP ID | ID OP ID;
assignment: ID EQ expression SC;

%%
int yywrap(){
return 1;
}
yyerror(s)
char *s;
{printf("%s,Sorry statement not valid\n", s);
}
int main(int argc, char *argv[]){
    if(argc == 2 ){
        yyin = fopen(argv[1],"r");
        if(yyin == NULL){
            fprintf(stderr,"Sorry could no open file : %s\n",argv[1]);
            return 3;
        }
        yyparse();
    }else{
        yyin = stdin;
        yyparse();
    }
return 0;
}