%{
#include <stdio.h>
#include <string.h>
extern int yylex();
extern int yyparse();
extern FILE * yyin;


void yyerror(const char *str)
{
	fprintf(stderr,"error: %s\n", str);
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

assignment:
	value expression SC
	{
		printf("all together\n");
	}
	|
	value ident
	{
		printf("refer to 1\n");
	}
	;
expression: 
	operator ID
	{
		printf("expression\n");
	}
	;
operator:
	ident ADD
	{
		printf("addition\n");
	}
	|
	ident SUB
	{
		printf("subtraction\n");
	}
	|
	ident MUL
	{
		printf("multiply\n");
	}
	|
	ident DIV
	{
		printf("divide\n");
	}
	|
	ident MOD
	{
		printf("modulus\n");
	}
	;
value:
	ident EQ
	{
		printf("value equals\n");
	}
	;
ident:
	ID
	{
		printf("this is an ID\n");
	}
	;
	
%% 
