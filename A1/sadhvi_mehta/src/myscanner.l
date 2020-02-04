%{
#include "y.tab.h" /* token types */
#include <stdio.h>
#include <stdlib.h>
%}
DIGIT [0-9]
%option yylineno

	extern int print_tokens; /* global var to print tokens or not */

%%

[ \t\n\r]+
#[^\n]*\n

var	{if(print_tokens == 1) printf("tVAR\n"); return tVAR;}
string	{if(print_tokens == 1) printf("tSTRING\n"); return tSTRING;}
else	{if(print_tokens == 1) printf("tELSE\n"); return tELSE;}
print	{if(print_tokens == 1) printf("tPRINT\n"); return tPRINT;}
float	{if(print_tokens == 1) printf("tFLOAT\n"); return tFLOAT;}
bool	{if(print_tokens == 1) printf("tBOOL\n"); return tBOOL;}
while	{if(print_tokens == 1) printf("tWHILE\n"); return tWHILE;}
True	{if(print_tokens == 1) printf("tTRUE\n"); return tTRUE;}
int	{if(print_tokens == 1) printf("tINT\n"); return tINT;}
if	{if(print_tokens == 1) printf("tIF\n"); return tIF;}
read	{if(print_tokens == 1) printf("tREAD\n"); return tREAD;}
False	{if(print_tokens == 1) printf("tFALSE\n"); return tFALSE;}

"+"	{if(print_tokens == 1) printf("tPLUS\n"); return tPLUS;}
"-"	{if(print_tokens == 1) printf("tMINUS\n"); return tMINUS;}
"*"	{if(print_tokens == 1) printf("tTIMES\n"); return tTIMES;}
"/"	{if(print_tokens == 1) printf("tDIV\n"); return tDIV;}
"=="	{if(print_tokens == 1) printf("tEQUALS\n"); return tEQUALS;}
"!="	{if(print_tokens == 1) printf("tNOTEQUALS\n"); return tNOTEQUALS;}
">="	{if(print_tokens == 1) printf("tGREATEREQUALS\n"); return tGREATEREQUALS;}
"<="	{if(print_tokens == 1) printf("tLESSEQUALS\n"); return tLESSEQUALS;}
">"	{if(print_tokens == 1) printf("tGREATER\n"); return tGREATER;}
"<"	{if(print_tokens == 1) printf("tLESS\n"); return tLESS;}
"&&"	{if(print_tokens == 1) printf("tAND\n"); return tAND;}
"||"	{if(print_tokens == 1) printf("tOR\n"); return tOR;}
"!"	{if(print_tokens == 1) printf("tBANG\n"); return tBANG;}

"("	{if(print_tokens == 1) printf("tLEFTPAREN\n"); return tLEFTPAREN;}
")"	{if(print_tokens == 1) printf("tRIGHTPAREN\n"); return tRIGHTPAREN;}
"{"	{if(print_tokens == 1) printf("tLEFTBRACE\n"); return tLEFTBRACE;}
"}"	{if(print_tokens == 1) printf("tRIGHTBRACE\n"); return tRIGHTBRACE;}

"="	{if(print_tokens == 1) printf("tASSIGN\n"); return tASSIGN;}
":"	{if(print_tokens == 1) printf("tCOLON\n"); return tCOLON;}
";"	{if(print_tokens == 1) printf("tSEMICOLON\n"); return tSEMICOLON;}

0|([1-9]{DIGIT}*)						{
									if(print_tokens == 1) printf("tINTVAL(%s)\n", yytext); 
									yylval.intval = atoi(yytext);
									return tINTVAL;
								}
([1-9]{DIGIT}*"."{DIGIT}+)|(0"."{DIGIT}+)			{
									if(print_tokens == 1) printf("tFLOATVAL(%s)\n", yytext);
									yylval.floatval = strtof(yytext, NULL);
									return tFLOATVAL;
								}
\"[^"]*\"							{
									if(print_tokens == 1) printf("tSTRINGVAL(%s)\n", yytext);
									yylval.stringval = strdup(yytext);
									return tSTRINGVAL;
								}

[a-zA-Z_]+[a-zA-Z0-9_]*						{
									if(print_tokens == 1) printf("tIDENTIFIER(%s)\n", yytext);
									yylval.identifier = strdup(yytext);
									return tIDENTIFIER;
								}

{DIGIT}{DIGIT}*							{fprintf(stderr, "Error: (line %d) invalid integer '%s'\n", yylineno, yytext); exit(1);}
(0{DIGIT}+"."{DIGIT}+)|({DIGIT}+".")|("."{DIGIT}+)		{fprintf(stderr, "Error: (line %d) invalid float '%s'\n", yylineno, yytext); exit(1);}
.								{fprintf(stderr, "Error: (line %d) unexpected character '%s'\n", yylineno, yytext); exit(1);}
	

%%
