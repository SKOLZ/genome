%{
        #include <stdio.h>
%}

%%
^AUG		printf("");
AA[A,G] 	printf("K");;
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
TA[A,G]$	printf("STOP");
TA[C,T]		printf("Y");
TC[A,C,T,G]	printf("S");
TT[A,G]		printf("L");
TT[C,T]		printf("F");
TGA$		printf("STOP");
TG[C,T]		printf("C");
TGG		printf("W");
GA[A,G]		printf("E");
GA[C,T]		printf("D");
GC[A,C,T,G]	printf("A");
GT[A,C,T,G]	printf("V");
GG[A,C,T,G]	printf("G");
.		printf("ERROR");exit(0);
%%
int yywrap(void) { 
        return 1;
}
int main(void) {
        yylex();
        return 0;
}
