%{
#include <stdio.h>
#include <string.h>
extern int yylex();
extern int yyparse();
extern FILE * yyin;


void yyerror(char *s)
{
	fprintf(stderr,"error: %s\n", s);
}
int yywrap()
{
	return 1;
}
main()
{
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
	
}

%}
%token ID ADD SUB MUL DIV MOD SC EQ

%%

assignments:
	assignments assignment
	|
	assignment
	;
assignment:
	value expression SC
	{
		printf("good line (assignment)\n");
	}
	|
	value ident SC
	{
		printf("good line (assignment)\n");
	}
	|
	expression
	{
		printf("good line (expression)\n");
	}
	;

expression:
	expression operator
	|
	ident operator
	;
operator:
	ADD ident
	|
	SUB ident
	|
	MUL ident
	|
	DIV ident
	|
	MOD ident
	;
value:
	ident EQ
	;
ident:
	ID
	;
	
%%
