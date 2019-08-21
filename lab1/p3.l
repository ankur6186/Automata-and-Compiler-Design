%{
	#include<stdio.h>
	int d;
	char c;
%}

%%
[a-z] {d=yytext[0]; d=(d+5-'a')%26; d+='a'; c=(char)d; printf("%c",c);}
[A-Z] {d=yytext[0]; d=(d+5-'A')%26; d+='A'; c=(char)d; printf("%c",c);}
"\n" {printf("\n");}
"\t" {printf("\t");}
" " printf(" ");
. {;}
<<EOF>> {printf("\n"); yyterminate();}
%%

int yywrap(void){}

int main()
{
	yyin=fopen("p3.txt","r");
	yylex();

	return 0;
}