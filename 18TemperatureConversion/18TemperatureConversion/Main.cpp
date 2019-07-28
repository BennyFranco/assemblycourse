#include <iostream>

extern "C" double FtoC(double deg_f);
extern "C" double CtoF(double deg_c);

int main()
{
	double cel_temp = 30;
	double f_temp = 267;

	printf("Cel value:%10.41f Fah:%110.41f\n", cel_temp, CtoF(cel_temp));
	printf("Fah:%110.41f Cel value:%10.41f\n", f_temp, FtoC(f_temp));

	return 0;
}