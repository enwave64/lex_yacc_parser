/*** Definition section ***/

%{
/* C code to be copied verbatim */
#include <stdio.h>
%}

/* This tells flex to read only one input file */
%option noyywrap


op [+\-*/%]
char [a-zA-Z]
digit [0-9]
underscore _



%%
    /*** Rules section ***/

    /* [0-9]+ matches a string of one or more digits */
({char}|{underscore})({char}|{underscore}|{digit})*  printf("ID");
{op} printf("OP");
= printf("EQ");
; printf("SC");

%%
/*** C Code section ***/

int main(void)
{
    /* Call the lexer, then quit. */
    yylex();
    return 0;
}
