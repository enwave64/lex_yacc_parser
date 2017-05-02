%{
#include <stdio.h>
#include "y.tab.h"
%}
%%

[a-zA-Z_][a-zA-Z0-9_]*	return ID;
" + "			return ADD;
" - "			return SUB;
" * "			return MUL;
" / "			return DIV;
" % "			return MOD;
\n                      /* ignore end of line */;
[ \t]+                  /* ignore whitespace */;
";"			return SC;
"="			return EQ;

%%  
