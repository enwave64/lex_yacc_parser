%{
#include <stdio.h>
extern int yylex();
extern int yyparse();
extern FILE *yyin, *yyout;
%}

%token DIGIT
%token ID
%token OP
%token EQ
%token SC
%token NL

%%
starts:
	starts start |
    start
	;
start: expression NL 	{fputs("\tValid Statement\n", yyout);} |
       assignment NL {fputs("\tValid Statement\n", yyout);}  |
	   error NL {fputs("\tInvalid Statement\n", yyout);}
		;
expression: expression OP ID | ID OP ID ;
			
assignment: ID EQ expression SC	;

%%
int yywrap(){
	return 1;
}
void yyerror(char *s)
{}
int main(){
	FILE *myfile = fopen("in.txt","r");
	FILE *outfile = fopen("out.txt", "w");
	if(!myfile)
	{
		printf("invalid file\n");
	}
	yyin = myfile;
	yyout = outfile;
	do{
		yyparse();
	}while(!feof(yyin));
	fclose(yyin);
	fclose(yyout);
	return 0;
}
