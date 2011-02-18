all:
	lex dbl.l
	yacc -d dbl.y
	cc -c lex.yy.c -o lex.yy.o
	cc -std=c99 -c y.tab.c -o y.tab.o
	#cc lex.yy.c y.tab.c -std=c99 -o blah
	g++ -o cirb cirb.cpp lex.yy.o y.tab.o

clean:
	rm -rf y.tab.h cirb lex.yy.c y.tab.c lex.yy.o y.tab.o
