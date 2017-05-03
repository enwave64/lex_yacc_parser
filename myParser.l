
%{
#include<stdio.h>
#include "y.tab.h"
%}

op [+\-*/%]
char [a-zA-Z]
digit [0-9]


%%
" " ; /*ignore whitespace*/
({char}|_)({char}|_|{digit})* 	{ECHO; return ID;}
{op} 				{ECHO; return OP;}
"=" 				{ECHO; return EQ;}
";"				{ECHO; return SC;}
[ \t]+				;
\n				return NL;

%% 
