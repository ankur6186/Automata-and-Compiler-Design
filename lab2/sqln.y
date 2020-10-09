%{
#include <stdio.h>
#include <stdlib.h>
%}
%token ID NUM SELECT DISTINCT FROM WHERE LE GE EQ NE OR AND LIKE GROUP HAVING ORDER ASC DESC  JOIN  ON
%right '='
%left AND OR
%left '<' '>' LE GE EQ NE

%%

    S : ST1';' {printf("Query accepted\n");exit(0);};
    ST1: SELECT attributeList FROM tableList ST7
        | SELECT DISTINCT attributeList FROM tableList ST7
        ;
    ST2 : WHERE CONDITION ST3
          | ST3
          ;
    ST3 : GROUP attributeList ST4
          | ST4
          ;
    ST4 : HAVING CONDITION ST5
          | ST5
          ;
    ST5 : ORDER attributeList ST6
          |
          ;
    ST6 : DESC
        | ASC
        |
         ;
    ST7 : JOIN tableList ON CONDITION ST2
          ;
  attributeList :ID','attributeList
               | '*'
               | ID
               ;
 tableList: ID',' tableList
          | ID
          ;
    CONDITION: CONDITION OR CONDITION
        | CONDITION AND CONDITION
        | E
         ;
    E : F '=' F
     | F '<' F
     | F '>' F 
     | F LE F
     | F GE F
      | F EQ F
     | F NE F
     | F OR F
     | F AND F
     | F LIKE F
     ;
    F : ID
      | NUM 
       ;
%%

#include"lex.yy.c"
#include<ctype.h>
main()
{
    printf("Enter the query:");
    yyparse();
}          
