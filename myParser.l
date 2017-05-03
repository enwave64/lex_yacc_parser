
%{
#include<stdio.h>
#include "y.tab.h"
%}

op [+\-*/%]
char [a-zA-Z]
digit [0-9]


%%
" " ; /*ignore whitespace*/
({char}|_)({char}|_|{digit})* {return (ID);}
{op} {return OP;}
"=" {return EQ;}
";" {return SC;}
[ \t\n]+	;

%% 
