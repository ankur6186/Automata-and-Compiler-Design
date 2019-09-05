%{
	#include<stdio.h>
	#include<string.h>
	FILE *ff,*fr;
	char p[20],q[20];
%}
word [a-zA-Z]+
eol \n
%%

{word} {
                if(strcmp(p,yytext)==0)
                        fprintf(fr,q);
                else
                        fprintf(fr,yytext);

        }
{eol} {fprintf(fr,yytext);}
. {fprintf(fr,yytext);}
%%

int yywrap()
{
	return 1;
}

int main()
{
	printf("Enter the word to be replaced: ");
	gets(p);
	printf("Enter the replaced word: ");
	gets(q);
    ff=fopen("p9_1.txt","r+");
    fr=fopen("p9_2.txt","w+");
    yyin=ff;
    yylex();
    return(0);
}