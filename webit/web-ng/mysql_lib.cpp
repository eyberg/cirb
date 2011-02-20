#include <iostream>
#include <mysql.h>
#include "mysql_lib.h"

using namespace std;

extern "C" void sql_query()
{

  MYSQL *connection, mysql;
  MYSQL_RES *result;
  MYSQL_ROW row;
  int query_state;

  mysql_init(&mysql);
  connection = mysql_real_connect(&mysql,"host","user","password","database",0,0,0);
  connection = mysql_real_connect(&mysql,"localhost","devuser","changem123","clicksaw",0,0,0);
  
  if (connection == NULL) {
    cout << mysql_error(&mysql) << endl;
    return;
  }

  query_state = mysql_query(connection, "select * from users;");

  if (query_state !=0) {
    cout << mysql_error(connection) << endl;
    return;
  }

  result = mysql_store_result(connection);
  while ( ( row = mysql_fetch_row(result)) != NULL ) {
    cout << row[0] << endl;
    cout << row[1] << endl;
  }

  mysql_free_result(result);
  mysql_close(connection);

  return;
}
