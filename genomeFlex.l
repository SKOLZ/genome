%{
        #include <stdio.h>
%}

%%
AA[A,G] 	K;
AA[C,T] 	N;
AC[A,C,T,G]	T;
AT[A,C,T]	I;
ATG		M;
AG[A,G]		R;
CA[A,G]		Q;
CA[C,T]		H;
CC[A,C,T,G]	P;
CT[A,C,T,G]	L;
CG[A,C,T,G]	R;
TA[A,G]		'\n';
TA[C,T]		Y;
TC[A,C,T,G]	S;
TT[A,G]		L;
TT[C,T]		F;
TGA		'\n';
TG[C,T]		C;
TGG		W;
GA[A,G]		E;
GA[C,T]		D;
GC[A,C,T,G]	A;
GT[A,C,T,G]	V;
GG[A,C,T,G]	G;
%%
int yywrap(void) { 
        return 1;
}
int main(void) {
        yylex();
        return 0;
}
