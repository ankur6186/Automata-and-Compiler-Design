%{
	#include<stdio.h>
	int count=0,count1=0;
%}

%%
[/][/][ a-zA-Z0-9]* {count++;}
"float" {count1++;}
"char" {count1++;}
"int" {count1++;}
"double" {count1++;}
"long" {;}
"unsigned" {;}
. {fprintf(yyout,"%s",yytext);}
"\n" {fprintf(yyout,"\n");}
<<EOF>> {printf("No. of comment lines:%d and identifiers:%d\n",count,count1);yyterminate();}
%%

int yywrap(){}

int main()
{
	extern FILE *yyin,*yyout;
	yyin=fopen("p4.c","r");
	yyout=fopen("p4.txt","w");
	yylex();

	return 0;
}