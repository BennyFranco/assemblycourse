#include <iostream>

extern "C" void RectToPolar(double x, double y, double* r, double* a);
extern "C" void PolarToRect(double r, double a, double* x, double* y);

int main()
{
	double x[] = { 0,3, -3,-5,6 };
	double y[] = { 0,3,5,7,8 };

	const int nx = sizeof(x) / sizeof(double);
	const int ny = sizeof(y) / sizeof(double);

	for (int i = 0; i < ny; i++)
	{
		double r, a, _x, _y;
		RectToPolar(x[i], y[i], &r, &a);
		PolarToRect(r, a, &_x, &_y);

		printf("%8.4f, %8.4f - ", x[i], y[i]);
		printf("(%8.4f, %10.4f) - ", r, a);
		printf("(%8.4f, %8.4f)\n", _x, _y);
	}

	return 0;
}