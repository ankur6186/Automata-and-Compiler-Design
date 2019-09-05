%{
	#include<stdio.h>
	int flaga=0,flags=0,flagm=0,flagd=0,op=0,flag=0;
%}
%%

[a-zA-Z]+	{printf("%s is an identifier\n",yytext);}
[+-/][+-/]* {printf("Not a valid expression\n"); yyterminate();}
[*][*]+		{printf("Not a valid expression\n"); yyterminate();}
[a-zA-Z][+][a-zA-Z]	{flaga=1;}
[+][a-zA-Z]	{flaga=1;}
[a-zA-Z][-][a-zA-Z] {flags=1;}
[-][a-zA-Z] {flags=1;}
[a-zA-Z][*][a-zA-Z] {flagm=1;}
[a-zA-Z][/][a-zA-Z] {flagd=1;}
[(] 	{op++;}
[)] 	{op--; 
		if(op < 0)
		{
			printf("Not a valid expression\n");
			yyterminate();
		}}
[\n]	{if(op != 0) 
			printf("Not a valid expression\n"); 
		else
		{ 
			printf("Valid expression\n");
			printf("Operators are: ");
			if(flaga==1) printf("+ ");
			if(flags==1) printf("- ");
			if(flagm==1) printf("* ");
			if(flagd==1) printf("/ ");
			printf("\n");
		}
		yyterminate();}
%%

int main()
{
	printf("Enter the expression:\n");
	yylex();
	
	return 0;
}
