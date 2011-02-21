all: mysql_lib.o
	lex dbl.l
	#lex -o output/lex.yy.c dbl.l
	yacc -d dbl.y
	cc -c lex.yy.c -o lex.yy.o
	#cc -c output/lex.yy.c -o lex.yy.o
	cc -g -std=c99 -c y.tab.c -o y.tab.o
	#cc lex.yy.c y.tab.c -std=c99 -o blah
	g++ -g -o cirb cirb.cpp lex.yy.o y.tab.o mysql_lib.o -L/usr/include/mysql -lmysqlclient -I/usr/include/mysql

mysql_lib.o:
	g++ -c mysql_lib.cpp -L/usr/include/mysql -lmysqlclient -I/usr/include/mysql

clean:
	rm -rf y.tab.h cirb lex.yy.c y.tab.c *.o
