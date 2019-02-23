#include <iostream>

extern "C" void Reverser(int* destination, const int* source, int size);
int main()
{
	const int size = 10;
	int source[size], destination[size];

	for(int i = 0; i < size; i++)
	{
		source[i] = i;
	}

	Reverser(destination, source, size);

	printf("\n---------------Array Reverser---------------\n");
	for(int i = 0; i < size; i++)
	{
		printf("y:	%5d			x:	%5d\n", destination[i], source[i]);
	}

	return 0;
}