/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    tINTVAL = 258,
    tFLOATVAL = 259,
    tSTRINGVAL = 260,
    tIDENTIFIER = 261,
    tVAR = 262,
    tSTRING = 263,
    tFLOAT = 264,
    tBOOL = 265,
    tINT = 266,
    tTRUE = 267,
    tFALSE = 268,
    tWHILE = 269,
    tIF = 270,
    tELSE = 271,
    tREAD = 272,
    tPRINT = 273,
    tPLUS = 274,
    tMINUS = 275,
    tTIMES = 276,
    tDIV = 277,
    tEQUALS = 278,
    tNOTEQUALS = 279,
    tGREATEREQUALS = 280,
    tLESSEQUALS = 281,
    tGREATER = 282,
    tLESS = 283,
    tAND = 284,
    tOR = 285,
    tBANG = 286,
    tLEFTPAREN = 287,
    tRIGHTPAREN = 288,
    tLEFTBRACE = 289,
    tRIGHTBRACE = 290,
    tASSIGN = 291,
    tCOLON = 292,
    tSEMICOLON = 293,
    tNEG = 294
  };
#endif
/* Tokens.  */
#define tINTVAL 258
#define tFLOATVAL 259
#define tSTRINGVAL 260
#define tIDENTIFIER 261
#define tVAR 262
#define tSTRING 263
#define tFLOAT 264
#define tBOOL 265
#define tINT 266
#define tTRUE 267
#define tFALSE 268
#define tWHILE 269
#define tIF 270
#define tELSE 271
#define tREAD 272
#define tPRINT 273
#define tPLUS 274
#define tMINUS 275
#define tTIMES 276
#define tDIV 277
#define tEQUALS 278
#define tNOTEQUALS 279
#define tGREATEREQUALS 280
#define tLESSEQUALS 281
#define tGREATER 282
#define tLESS 283
#define tAND 284
#define tOR 285
#define tBANG 286
#define tLEFTPAREN 287
#define tRIGHTPAREN 288
#define tLEFTBRACE 289
#define tRIGHTBRACE 290
#define tASSIGN 291
#define tCOLON 292
#define tSEMICOLON 293
#define tNEG 294

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 7 "myparser.y" /* yacc.c:1909  */

	int intval;
	float floatval;
	char *stringval;
	char *identifier;

#line 139 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
