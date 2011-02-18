all:
	lex thermo.l
	yacc -d thermo.y
	cc lex.yy.c y.tab.c -std=c99 -o blah

clean:
	rm -rf y.tab.h blah lex.yy.c y.tab.c
