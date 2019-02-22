#include <iostream>

extern "C" {

int hello()
{
	std::cout << "g++ -shared -o libhello.so hello.cpp\n";
	return 0;
}

}
