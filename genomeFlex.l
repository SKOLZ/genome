%{
        #include <stdio.h>
	void parse();
	long double position = 0;
	int orderMatters = 1;
%}

%%
^AUG		;
AA[A,G] 	{putchar('K');position++;}
AA[C,T] 	{putchar('N');position++;}
AC[A,C,T,G]	{putchar('T');position++;}
AT[A,C,T]	{putchar('I');position++;}
ATG		{putchar('M');position++;}
AG[A,G]		{putchar('R');position++;}
AG[C,T]		{putchar('S');position++;}
CA[A,G]		{putchar('Q');position++;}
CA[C,T]		{putchar('H');position++;}
CC[A,C,T,G]	{putchar('P');position++;}
CT[A,C,T,G]	{putchar('L');position++;}
CG[A,C,T,G]	{putchar('R');position++;}
TA[C,T]		{putchar('Y');position++;}
TC[A,C,T,G]	{putchar('S');position++;}
TT[A,G]		{putchar('L');position++;}
TT[C,T]		{putchar('F');position++;}
TG[C,T]		{putchar('C');position++;}
TGG		{putchar('W');position++;}
GA[A,G]		{putchar('E');position++;}
GA[C,T]		{putchar('D');position++;}
GC[A,C,T,G]	{putchar('A');position++;}
GT[A,C,T,G]	{putchar('V');position++;}
GG[A,C,T,G]	{putchar('G');position++;}
TGA$		;
TA[A,G]$	;
STOP		;
"{-}"
"["[0-9]+"]"	;
"{-}["[0-9]+"]"	printf("\nEnd of codon - Begining of new codon from here\n");
"{"(A|C|T|G)(((A|C|T|G)+|,)*(A|C|T|G))?"}"      parse();
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
