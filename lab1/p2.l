%{
	#include<stdio.h>
	int count1=0,count2=0;
%}

%%
"scanf"		{fprintf(yyout,"readf"); 
			count1++;}
"printf" 	{fprintf(yyout,"writef");
			count2++;}
.			{fprintf(yyout,"%s",yytext);}
"\n"		{fprintf(yyout,"\n");}
<<EOF>>		{printf("Number of scanf:%d and printf:%d\n",count1,count2);
			yyterminate();}
%%

int yywrap(void){}

int main()
{
	extern FILE *yyin,*yyout;
	yyin=fopen("p2.c","r");
	yyout=fopen("p2.txt","w");
	yylex();

	return 0;
}