#include <iostream>

extern "C" int IntegerMulDiv(int a, int b, int* prod, int* quo, int* rem);

int main()
{
	int	a = 21, b = 9;
	int prod = 0, quo = 0, rem = 0;

	int rv = IntegerMulDiv(a, b, &prod, &quo, &rem);

	std::cout << "rv: " << rv << std::endl;

	return 0;
}