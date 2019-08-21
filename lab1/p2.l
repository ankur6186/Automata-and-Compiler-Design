%{
	#include<stdio.h>
	int count1=0,count2=0;
%}

%%
"scanf" {count1++;}
"printf" {count2++;}
. {;}
"\n" {;}
<<EOF>> {printf("Number of scanf:%d and printf:%d\n",count1,count2);yyterminate();}
%%

int yywrap(void){}

int main()
{
	yyin=fopen("p2.c","r");
	yylex();

	return 0;
}