#include <iostream>
#include <sstream>
#include <cstring>
#include <string>
#include <mysql.h>

using namespace std;

#define NUMBER 400
#define STRING 401
#define SPACE 402

std::string eval(string input);

int main()
{

  string input;

  while( input != "exit") {
 
    cout << ">";
 
    cin >> eval(input);

    cout << input << endl;
  }

  return 0;
}

std::string eval(string input) {
  string retstr;


  return retstr;
}
