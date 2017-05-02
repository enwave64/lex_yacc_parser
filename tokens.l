/*** Definition section ***/

%{
/* C code to be copied verbatim */
#include <stdio.h>
#include "y.tab.h"
%}

/* This tells flex to read only one input file */
%option noyywrap


op [+\-*/%]
char [a-zA-Z]
digit [0-9]
underscore _
semicolon ;
equalsign =



%%
 /*** Rules section ***/

[ \t\n]*({char}|{underscore})({char}|{underscore}|{digit})*[ \t\n]* {
			 printf("ID");
			return (ID);}
[ \t\n]*{op}[ \t\n]* {
    printf("OP");
	return OP;
}
[ \t\n]*{equalsign}[ \t\n]* {printf("EQ"); return EQ;}
[ \t\n]*{semicolon}[ \t\n]* { printf("SC"); return SC;}

%%
/*** C Code section ***/

int main(void)
{
    /* Call the lexer, then quit. */
    yylex();
    return 0;
}
