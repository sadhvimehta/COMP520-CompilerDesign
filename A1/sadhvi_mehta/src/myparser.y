%{
	#include <stdio.h>
	void yyerror(const char *s) { fprintf(stderr, "Error: %s\n", s); exit(1); }
%}
%error-verbose

%union {
	int intval;
	float floatval;
	char *stringval;
	char *identifier;
}

%token <intval> tINTVAL
%token <floatval> tFLOATVAL
%token <stringval> tSTRINGVAL
%token <identifier> tIDENTIFIER

%token tVAR
%token tSTRING tFLOAT tBOOL tINT
%token tTRUE tFALSE
%token tWHILE tIF tELSE
%token tREAD tPRINT
%token tPLUS tMINUS tTIMES tDIV
%token tEQUALS tNOTEQUALS tGREATEREQUALS tLESSEQUALS tGREATER tLESS
%token tAND tOR tBANG
%token tLEFTPAREN tRIGHTPAREN tLEFTBRACE tRIGHTBRACE
%token tASSIGN tCOLON tSEMICOLON

%left tOR
%left tAND
%left tEQUALS tNOTEQUALS
%left tGREATEREQUALS tLESSEQUALS tGREATER tLESS
%left tPLUS tMINUS
%left tTIMES tDIV
%left tNEG
%left tBANG

%start prog

%%

prog	: sect
;

sect	: /* empty */
     	| stmt sect
     	| decl sect
;

decl 	: tVAR tIDENTIFIER tCOLON type tASSIGN exp tSEMICOLON
     	| tVAR tIDENTIFIER tASSIGN exp tSEMICOLON
;

stmt	: tPRINT tLEFTPAREN exp tRIGHTPAREN tSEMICOLON
	| tIDENTIFIER tASSIGN exp tSEMICOLON
	| tWHILE tLEFTPAREN exp tRIGHTPAREN tLEFTBRACE sect tRIGHTBRACE
	| tREAD tLEFTPAREN exp tRIGHTPAREN tSEMICOLON
	| tIF tLEFTPAREN exp tRIGHTPAREN tLEFTBRACE sect tRIGHTBRACE else
	| tSTRINGVAL tLEFTPAREN exp tRIGHTPAREN
;

else	: /* empty */ /* if(){} */
     	| tELSE tLEFTBRACE sect tRIGHTBRACE /* if(){} else{} */
	| tELSE tIF tLEFTPAREN exp tRIGHTPAREN tLEFTBRACE sect tRIGHTBRACE else /* if(){} elif(){}*/
;

exp	: exp tMINUS exp
    	| exp tPLUS exp
	| exp tTIMES exp
	| exp tDIV exp
    	| exp tGREATEREQUALS exp
	| exp tLESSEQUALS exp
	| exp tGREATER exp
	| exp tLESS exp
	| exp tEQUALS exp
	| exp tNOTEQUALS exp
	| exp tOR exp
	| exp tAND exp
	| tMINUS exp %prec tNEG
	| tLEFTPAREN exp tRIGHTPAREN
	| value
;

type 	: tSTRING
     	| tFLOAT
	| tBOOL
	| tINT
;

value 	: tINTVAL
      	| tFLOATVAL
	| tSTRINGVAL
	| tIDENTIFIER
	| tTRUE
	| tFALSE
;

%%

