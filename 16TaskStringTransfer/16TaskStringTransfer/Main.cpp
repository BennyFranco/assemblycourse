#include <iostream>

extern "C" char* GetString();

int main()
{
	std::cout << GetString() << std::endl;

	return 0;
}