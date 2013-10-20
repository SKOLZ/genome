%{
        #include <stdio.h>
	void parse();
	void func();
	int getpos();
	long double position = 0;
	int orderMatters = 1;
%}

%%
^AUG								;
AA[A,G] 							{putchar('K');position+=3;}
AA[C,T] 							{putchar('N');position+=3;}
AC[A,C,T,G]							{putchar('T');position+=3;}
AT[A,C,T]							{putchar('I');position+=3;}
ATG								{putchar('M');position+=3;}
AG[A,G]								{putchar('R');position+=3;}
AG[C,T]								{putchar('S');position+=3;}
CA[A,G]								{putchar('Q');position+=3;}
CA[C,T]								{putchar('H');position+=3;}
CC[A,C,T,G]							{putchar('P');position+=3;}
CT[A,C,T,G]							{putchar('L');position+=3;}
CG[A,C,T,G]							{putchar('R');position+=3;}
TA[C,T]								{putchar('Y');position+=3;}
TC[A,C,T,G]							{putchar('S');position+=3;}
TT[A,G]								{putchar('L');position+=3;}
TT[C,T]								{putchar('F');position+=3;}
TG[C,T]								{putchar('C');position+=3;}
TGG								{putchar('W');position+=3;}
GA[A,G]								{putchar('E');position+=3;}
GA[C,T]								{putchar('D');position+=3;}
GC[A,C,T,G]							{putchar('A');position+=3;}
GT[A,C,T,G]							{putchar('V');position+=3;}
GG[A,C,T,G]							{putchar('G');position+=3;}
"{-}"								printf("\n");
"["[0-9]+"]"							func();
"{"(A|C|T|G)(((A|C|T|G)+|,)*(A|C|T|G))?"}"      		parse();
(A|C|T|G)"{"(A|C|T|G)(((A|C|T|G)+|,)*(A|C|T|G))?"}" 		parse();
(A|C|T|G)(A|C|T|G)"{"(A|C|T|G)(((A|C|T|G)+|,)*(A|C|T|G))?"}"	parse();
"{-}*"								{orderMatters = 0;}
"{"(A|C|T|G)(((A|C|T|G)+|,)*(A|C|T|G))?"}*" 			{orderMatters = 0;}
TGA$								;
TA[A,G]$							;
STOP								;
.								{printf("invalid DNA"); return;}
%%
int yywrap(void) {
	return 1;
}
int main(void) {
	yylex();
	return 0;
}

void parse() {
	int firstElemLength = 0;
	int i = 0;
	int beginingElem;

	//unput the letters before the { to be used later
	while(yytext[i] != '{'){
		unput(yytext[i]);
		i++;
	}

	//get inside the {} and set the start
	i++;
	beginingElem = i;

	//get the legth from the first input from inside de {}
	while(yytext[i] != ',' && yytext[i] != '}'){
		firstElemLength++;
		
	}

	//parse to unput the elements inside 
	while (firstElemLength > 0) {
		unput(beginingElem[i]);
		beginingElem++;
		firstElemLength--;
	}
}

void func() {
	if (!orderMatters) {
		orderMatters = 1;
		position = getpos();
	} else {
		if (getpos() != position) {
			printf("Position mismatch");
		}
	}
}

int getpos() {
	return 1;
}
