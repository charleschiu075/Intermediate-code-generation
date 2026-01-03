%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);
extern FILE *yyin;
%}

%union {
    long value;
}

%token <value> NUMBER

%type <value> expression term factor

%%
input:
      /* empty */
    | input expression ';' { printf("%ld\n", $2); }
    ;

expression:
      term
    | expression '+' term { $$ = $1 + $3; }
    | expression '-' term { $$ = $1 - $3; }
    ;

term:
      factor
    | term '*' factor { $$ = $1 * $3; }
    | term '/' factor { $$ = $1 / $3; }
    ;

factor:
      NUMBER
    | '(' expression ')' { $$ = $2; }
    | '-' factor { $$ = -$2; }
    ;
%%

int main(void) {
    yyin = fopen("testcase.in", "r");
    if (!yyin) {
        perror("testcase.in");
        return EXIT_FAILURE;
    }
    return yyparse();
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
