/*parser.y */
%{
#include <stdio.h>
#include <string.h>
extern int yylex();
extern int yyparse();
extern FILE * yyin;

void yyerror(char *s){
    fprintf(stderr,"error: %s\n",s);
}
int yywrap(){
    return 1;
}
main(){
    FILE *myfile = fopen("in.txt","r");
    if(!myfile){
        printf("Unable to read\n");
    }
    yyin =  myfile;
    do{
        yyparse();
    }while(!feof(yyin));
    fclose(yyin);
}

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