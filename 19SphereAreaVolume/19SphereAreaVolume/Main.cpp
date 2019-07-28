#include <iostream>

extern "C" bool	CalcSphereAreaAndVolume(double r, double* sa, double* sv);

int main()
{
	double r[] = { 0.0,1.0,2.0,3.0,4.0,5.0,20.0,34.0 };
	int n = sizeof(r) / sizeof(double);

	for (int i = 0; i < n; i++)
	{
		double sa = -1;
		double v = -1;

		bool rv = CalcSphereAreaAndVolume(r[i], &sa, &v);

		printf("rc:%d r:%8.8f sa:%10.8f v:%10.8f\n", rv, r[i], sa, v);
	}
	
	return 0;
}