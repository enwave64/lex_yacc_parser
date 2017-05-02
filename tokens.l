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
({char}|{underscore})+({char}|{underscore}|{digit})*[ ] {
			 printf("ID");
			return (ID);}

{op}[ ] {
    printf("OP");
	return OP;
}
{equalsign}[ ] {printf("EQ"); return EQ;}
{semicolon}[ ] { printf("SC"); return SC;}

%%
