#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int print_tokens = 0; /* gloval var to print tokens or not */

int yyparse();
int yylex();

int main(int argc, char *argv[]) {
	// determine mode:
	// scan-mode:
	if (strcmp(argv[1], "scan") == 0) {
		while(yylex()) {}
		printf("OK\n");
		return 0;
	}
	// tokens-mode:
	if (strcmp(argv[1], "tokens") == 0) {
		print_tokens = 1; // set to 1 so scanner prints tokens
		while(yylex()) {}
		return 0;
	}
	// parse-mode:
	if (strcmp(argv[1], "parse") == 0) {
		 while(yyparse()) {}
		 printf("OK\n");
		 return 0;
	 }
	 // invalid-mode:
	 fprintf(stderr, "Error: invalid mode \n");
	 exit(1);
}
