%{ 
	#include<stdio.h>
	#include<string.h>
	int count=0,max=0;
	char* c;
%} 

%%
[a-zA-Z]* {count=yyleng; if(count>max){max=count; c=(char*)realloc(c,yyleng); strcpy(c,yytext);}}
. {;}
"\n" {;}
<<EOF>> {printf("%d\n",max); count=strlen(c); for(int i=count-1;i>=0;i--) printf("%c",c[i]); printf("\n"); yyterminate();}
%% 

int yywrap(void){} 

int main() 
{ 
	yyin=fopen("p1.txt","r");
	yylex();

	return 0; 
} 
