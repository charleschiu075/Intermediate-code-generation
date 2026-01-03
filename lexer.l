%option noyywrap nounput noinput nodefault
%{
#include <stdlib.h>
#include "parser.tab.h"
%}

%%
[0-9]+ {
    yylval.value = strtol(yytext, NULL, 10);
    return NUMBER;
}
";"             { return ';'; }
[ \t\r\n]+      { /* skip whitespace */ }
.               { return yytext[0]; }
%%
