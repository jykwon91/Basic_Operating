#include <stdio.h>

int main(void)
{
	printf("%8.1e\n", 12345.123345);
	printf("%8.8e\n", 12345.123345);
	printf("%8.3f\n", 12345.123345);
	printf("%.6f\n", 12345.123345);
}
