# build an executable named gen from lex.yy.c.c
all: lex.yy.c
	flex genomeFlex.l && gcc lex.yy.c -o gen -lfl
	./gen
clean:
	$(RM) gen
