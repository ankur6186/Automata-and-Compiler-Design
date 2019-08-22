%{
	#include<stdio.h>
	int count=0;
%}

%%
[a-zA-Z0-9]*[a][b][ \n\t]	{count++;}
[ \n\t]						{;}
.							{;}
[a-zA-Z0-9]*[a][b][<<EOF>>]	{count++;printf("Number of words ending with ab:%d\n",count); yyterminate();}
<<EOF>>						{count++;printf("Number of words ending with ab:%d\n",count); yyterminate();}
%%

int yywrap(void){}

int main()
{
	yyin=fopen("p8.txt","r");
	yylex();

	return 0;
}