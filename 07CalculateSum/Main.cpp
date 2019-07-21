#include <iostream>

extern "C" int AdderASM(int a, int b, int c);

int AdderCPP(int a, int b, int c);

int main()
{
	int a = 17, b = 11, c = 14;
	int sum = AdderASM(a, b, c);

	std::cout << "a: " << a << "\n" \
			  << "b: " << b << "\n" \
			  << "c: " << c << "\n" \
			  << "Result: " << sum << std::endl; 
	return 0;
}

int AdderCPP(int a, int b, int c)
{
	return a + b + c;
}