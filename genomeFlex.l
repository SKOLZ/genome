%{
        #include <stdio.h>
	void parse(int position);
%}

%%
^AUG		printf("");
AA[A,G] 	printf("K");
AA[C,T] 	printf("N");
AC[A,C,T,G]	printf("T");
AT[A,C,T]	printf("I");
ATG		printf("M");
AG[A,G]		printf("R");
AG[C,T]		printf("S");
CA[A,G]		printf("Q");
CA[C,T]		printf("H");
CC[A,C,T,G]	printf("P");
CT[A,C,T,G]	printf("L");
CG[A,C,T,G]	printf("R");
TA[A,G]$	printf("");
TA[C,T]		printf("Y");
TC[A,C,T,G]	printf("S");
TT[A,G]		printf("L");
TT[C,T]		printf("F");
TGA$		printf("");
TG[C,T]		printf("C");
TGG		printf("W");
GA[A,G]		printf("E");
GA[C,T]		printf("D");
GC[A,C,T,G]	printf("A");
GT[A,C,T,G]	printf("V");
GG[A,C,T,G]	printf("G");
STOP		printf("");
"["[0-9]+"]"	printf("");
"{-}["[0-9]+"]"	printf("\nEnd of codon - Begining of new codon from here\n");
"{"(A|C|T|G)(((A|C|T|G)+|,)*(A|C|T|G))?"}"      parse();
		irintf("-in-");
%%
int yywrap(void) { 
        return 1;
}
int main(void) {
        yylex();
        return 0;
}

void parse() {
	char buffer[1024];
	int j = 0;
	int i = 1;
	for(i = position; yytext[i] != ',' && yytext[i] != '}'; i++) {
		buffer[j++] = yytext[i];
	}
	switch(j%3) {
		case 0:
			unput(yytext[position]);
			unput(yytext[position+1]);
			unput(yytext[position+2]);
			break;
		case 1:
			unput(yytext[position]);
			break;
		case 2:
			unput(yytext[position]);
			unput(yytext[position+1]);
			break;
	}
}
