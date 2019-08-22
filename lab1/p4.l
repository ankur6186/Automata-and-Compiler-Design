%{
	#include<stdio.h>
	int count=0,count1=0;
%}

%%
[/][/].*						{count++;}
[/][\*][a-zA-Z\n \t0-9]*[\*][/]	{count++;}
"float".*						{count1++; 
								for(int i=0;i<yyleng;i++) 
									if(yytext[i]==',') 
										count1++; 
								fprintf(yyout,"%s",yytext);}
"char".*						{count1++; 
								for(int i=0;i<yyleng;i++) 
									if(yytext[i]==',') 
										count1++; 
								fprintf(yyout,"%s",yytext);}
"int".*							{count1++; 
								for(int i=0;i<yyleng;i++) 
									if(yytext[i]==',') 
										count1++; 
								fprintf(yyout,"%s",yytext);}
"double".*						{count1++;
								for(int i=0;i<yyleng;i++) 
									if(yytext[i]==',') 
										count1++; 
								fprintf(yyout,"%s",yytext);}
.								{fprintf(yyout,"%s",yytext);}
"\n"							{fprintf(yyout,"\n");}
<<EOF>>							{printf("No. of comment lines:%d and identifiers:%d\n",count,count1-1);
								yyterminate();}
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