 %{
#include <stdio.h>
extern int yylex();
extern int yyparse();
extern FILE *yyin;
%}

%token ID
%token OP
%token EQ
%token SC
%token NL

%%
starts:
	starts start
	|
	start
	;
start: expression NL 	{printf(" is an expression\n");} |
        assignment NL {printf(" is an assignment\n");}
	;
expression: expression OP ID | ID OP ID;
assignment: ID EQ expression SC;

%%
int yywrap(){
	return 1;
}
void yyerror(char *s)
{
	fprintf(stderr, "error: it is not in expression\n", s);
}
int main(){
	FILE *myfile = fopen("in.txt","r");
	if(!myfile)
	{
		printf("invalid file\n");
	}
	yyin = myfile;
	do{

		yyparse();
	}while(!feof(yyin));
	fclose(yyin);
	return 0;

} 
