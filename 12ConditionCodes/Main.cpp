#include <iostream>

extern "C" int SignedMinA(int a, int b, int c);
extern "C" int SignedMaxA(int a, int b, int c);

extern "C" int SignedMinB(int a, int b, int c);
extern "C" int SignedMaxB(int a, int b, int c);

int main()
{
    int a = 345, b = -783, c =34;
    int minA, maxA, minB, maxB;
    
    minA = SignedMinA(a, b, c);
    minB = SignedMinB(a, b, c);
    maxA = SignedMaxA(a, b, c);
    maxB = SignedMaxB(a, b, c);

    printf("min A: %d, min B: %d, max A: %d, max B: %d", minA, minB, maxA, maxB);

    return 0;
}