#include <iostream>
#include <sstream>
#include <cstring>
#include <string>

#define VERSION "0.1"

extern "C" {
  #include "balls.h"
}

using namespace std;

int main()
{
  cout << "Cirb Version: " << VERSION << endl;

  putPrompt();
  balls();

  return 0;
}
