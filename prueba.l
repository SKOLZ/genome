%{
        #include <stdio.h>
%}

%%
"{-}["[0-9]+"]"	printf("caca");
"{"(A|C|T|G)(((A|C|T|G)+|,)*(A|C|T|G))?"}"	printf("--OK--");
.		ECHO;
%%
int yywrap(void) { 
        return 1;
}
int main(void) {
        yylex();
        return 0;
}
