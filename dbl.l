%{

#include <stdio.h>
#include "y.tab.h"
%}
%%

var                     return TOKVAR;
puts                    return TOKPUTS;
\"                      return QUOTES;
times                   return TIMES;
class                   return CLASS;
do                      return DO;
end                     return END;
query                   return QUERY;
\"[^\n]*\"              yylval=strdup(yytext); return TEXT;
'.'                     return PERIOD;
[-+()/*\n]              return *yytext;
[0-9]+                  yylval=atoi(yytext); return NUMBER;
[a-zA-Z]*               yylval=strdup(yytext); return WORD;
=                       return EQUALS;
[ \t]+                  /* ignore whitespace */;
%%
