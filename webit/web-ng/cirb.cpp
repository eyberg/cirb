#include <iostream>
#include <sstream>
#include <cstring>
#include <string>

extern "C" {
  #include "balls.h"
}

using namespace std;

int main()
{
  cout << "stuff" << endl;
  balls();

  return 0;
}
