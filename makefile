# build an executable named gen from lex.yy.c.c
all: lex.yy.c
	flex step1.l && gcc lex.yy.c -o step1 -lfl
	flex -Ca step2.l && gcc lex.yy.c -o step2 -lfl
	flex step3.l && gcc lex.yy.c -o step3 -lfl
	flex step4.l && gcc lex.yy.c -o step4 -lfl
	javac DetermineSpecies.java
	jar cfm DetermineSpecies.jar DetermineSpecies.txt DetermineSpecies.class
clean:
	$(RM) step1
