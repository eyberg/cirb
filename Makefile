all:
	g++ -o cirb cirb.cpp -L/usr/include/mysql -lmysqlclient -I/usr/include/mysql

clean:
	rm -rf cirb
