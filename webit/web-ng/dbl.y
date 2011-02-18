%{

#include <stdio.h>
#include <string.h>
#include "balls.h"

int firstEmptyCommand();

/* obj 'class' 
  just holds name, value for now */
typedef struct _wobj{
  char name[50];
  char value[50];
} wobj;

/* hold 40 objs for now */
const int size = 40;

char* history[20]; /* list of commands */
wobj list[40];  /* list of objs */

/* add command to list */
void addCommand(char *name) {
  int x = firstEmptyCommand();
  strcpy(history[x], name);
}

/* find first empty element in command history */
int firstEmptyCommand() {
  int pos = 0;
  for(int i = 0; i < size;i++){
      if (strcmp(history[i], "") == 0) {
        pos = i;
        break;
      }
  }
}

/* find value of name */
char * findVal(char *name) {
  char *retname;

  for(int i = 0; i < size;i++){
    if(strcmp(list[i].name, name) == 0) {
      retname = list[i].value; 
      break;
    }
  }
}

/* find first empty element */
int firstEmpty() {
  int pos = 0;
  for(int i = 0; i < size;i++){
      if (strcmp(list[i].name, "") == 0) {
        pos = i;
        break;
      }
  }
}

void putPrompt() {
  printf("\n > ");
}
 
%}

%token TOKPUTS EQUALS TOKVAR WORD NUMBER QUOTES TIMES DO PERIOD END
%left '+' '-'
%left '*' '/'

%%
commands: /* empty */
        | commands command
        ;

command:
        var_assign
        |
        statement
        |
        string_assign
        |
        do_loop
        |
        puts_var
        ;

statement:
      expression '\n' { printf("%d\n", $1); putPrompt(); }

expression:
        NUMBER
        |
        expression '*' expression
        {
          $$ = $1 * $3;
        }
        |
        expression '/' expression
        {
          $$ = $1 / $3;
        }
        |
        expression '-' expression 
        {
          $$ = $1 - $3;
        }
        |
        expression '+' expression 
        {
          $$ = $1 + $3;
        }
        | '(' expression ')'            { $$ = $2; };

do_loop:
      NUMBER TIMES DO WORD END '\n'
      {
        int x = $1;
        for(int i = 0; i < x; i++) {
          printf("%s", $4);
        }
        putPrompt();
      };

string_assign:
        TOKVAR WORD EQUALS QUOTES WORD QUOTES '\n'
        {
          int x = firstEmpty();
          char *name = strdup($2);
          char *value = strdup($5);
          strcpy(list[x].name, name);
          strcpy(list[x].value, value);

          putPrompt();
        }
        ;


var_assign:
        TOKVAR WORD EQUALS WORD '\n'
        {
          int x = firstEmpty();
          /* debug mode only
            printf("assigned %s to %s\n", $4, $3);
          */
          char *name = strdup($2);
          char *value = strdup($4);
          strcpy(list[x].name, name);
          strcpy(list[x].value, value);

          putPrompt();
        }
        ;

puts_var:
        TOKPUTS WORD '\n'
        {
          char *name = strdup($2);

          char *val = findVal(name);
          printf("%s\n", val);
          putPrompt();
        }
        ;

%%

void yyerror(const char *str)
{
        fprintf(stderr,"error: %s\n",str);
}
 
int yywrap()
{
        return 1;
}

void balls()
{
  yyparse();
}
