%{ 
	#include<stdio.h>
	#include<string.h>
	int count=0,max=0;
	string S;
%} 

%% 
([a-zA-Z]) {count++;}
([ \t\n]) {if(max<count) max=count;  count = 0;}
<<EOF>> {if(max<count) max=count;printf("Length of longest word is: %d\n", max);yyterminate();} 
%% 

int yywrap(void){} 

int main() 
{ 
	yyin=fopen("p1.txt","r");
	yylex(); 

	return 0; 
} 
