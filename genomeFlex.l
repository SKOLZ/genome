%{
        #include <stdio.h>
	#include <time.h>
	void parse(int position);
	void startTimer(void);
	void stopTimer(void);
	clock_t tic;
%}

%%
^AUG		startTimer();
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
TA[A,G]$	printf("[STOP]");stopTimer();
TA[C,T]		printf("Y");
TC[A,C,T,G]	printf("S");
TT[A,G]		printf("L");
TT[C,T]		printf("F");
TGA$		printf("[STOP]");stopTimer();
TG[C,T]		printf("C");
TGG		printf("W");
GA[A,G]		printf("E");
GA[C,T]		printf("D");
GC[A,C,T,G]	printf("A");
GT[A,C,T,G]	printf("V");
GG[A,C,T,G]	printf("G");
"["[0-9]+"]"	printf("");
"{-}["[0-9]+"]"	printf("\nEnd of codon - Begining of new codon from here\n");
"{"(A|C|T|G)(((A|C|T|G)+|,)*(A|C|T|G))?"}"      parse(1);
		irintf("-in-");
%%
int
yywrap(void) { 
        return 1;
}

int
main(void) {
        yylex();
        return 0;
}

void
startTimer(void) {
	tic = clock();
	printf("\nTime start = %f\n", tic);
}

void
stopTimer(void) {
	clock_t toc = clock();
	printf("\nTime stop = %f\n", (double)toc);
	printf("\nElapsed: %f seconds\n", (double)(toc - tic) / CLOCKS_PER_SEC);
}

void
parse(int position) {
	char buffer[1024];
	int j = 0;
	int i = position;
	/*while((yytext[i] != ',') || (yytext[i] != '}')) {
		i++;
		buffer[j] = yytext[i];
		j++;
	}*/
	for(i = position; yytext[i] != ',' && yytext[i] != '}'; i++) {
		buffer[j++] = yytext[i];
	}
	int k = position;
	while(j > 0) {
		if (j-3 >= 0) {
			unput(yytext[k]);
			unput(yytext[k+1]);
			unput(yytext[k+2]);
			k += 3;
		} else {
			switch(j) {
				case 1:
					unput(yytext[k]);
					k++;
					break;
				case 2:
					unput(yytext[k]);
					unput(yytext[k+1]);
					k+=2;
					break;
			}
		}
		j-=3;
	}
}
