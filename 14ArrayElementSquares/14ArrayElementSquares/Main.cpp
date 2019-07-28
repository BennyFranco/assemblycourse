#include <iostream>

extern "C" int CalcArraySquaresASM(int* y, int* x, int n);
int CalcArraySquaresCPP(int* y, int* x, int n);

int main()
{	
	int x[] = { 2,3,4,5,6,7,8,9 };
	
	const int n = sizeof(x) / sizeof(int);
	int y1[n];
	int y2[n];

	int asmSum = CalcArraySquaresASM(y2, x, n);
	int cppSum = CalcArraySquaresCPP(y1, x, n);

	for (int i = 0; i < n; i++)
	{
		printf("i = %2d x: %4d y1: %4d y2:%4d\n", i, x[i], y1[i], y2[i]);
	}

	printf("\nAssembly sum: %d", asmSum);
	printf("\nCpp sum: %d\n", cppSum);
	return 0;
}

int CalcArraySquaresCPP(int* y, int* x, int n)
{
	int sum = 0;

	for (int i = 0; i < n; i++)
	{
		y[i] = x[i] * x[i];
		sum += y[i];
	}

	return sum;
}