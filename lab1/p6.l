%{
	#include<stdio.h>
	int flag=0;
%}
%%
. {;}
[ \n\t] {;}
([ \n][aA][nN][dD][ \n])|([ \n][oO][rR][ \n])|([ \n][bB][uU][tT][ \n])|([ \n][sS][oO][ \n]) {printf("%s",yytext); flag=1;}
<<EOF>> {if(flag==1) printf("\nCompound sentence\n"); else printf("\nSimple sentence\n"); yyterminate();}
%%

int main()
{
	yyin=fopen("p1.txt","r");
	yylex();
	
	return 0;
}