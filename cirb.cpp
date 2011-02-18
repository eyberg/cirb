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

void lex(string line);

void parse();

void eval();

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

void eval() {
}

int lex(string line) {
  int retval;

  for(int x=0; x != line.length(); x++) {
    if(isdigit(line[x])) {
      retval = NUMBER;
    }

    if(line[x] == ' ') {
      return SPACE;
    }

    if(isalpha(line[x])) {
      retval = STRING;
    }
  }

}

void parse() {
}

std::string eval(string input) {
  string retstr;


  return retstr;
}
