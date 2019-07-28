#include <iostream>

extern "C" int CalcArraySum(int* x, int n);

int main()
{
	int x[] = { 1,3,4,5,10,8,45 };
	int n = sizeof(x) / sizeof(int);

	int sum = CalcArraySum(x, n);

	printf("ASM Sum: %d\n", sum);

	return 0;
}