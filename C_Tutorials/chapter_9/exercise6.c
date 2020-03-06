#include <stdio.h>

int main(void)
{
	int n = 123, k = 4, i;

	printf("n = %d\n", n);
	for (i = 1; i < k; i++)
		n /= 10;
	printf("%d\n", n);
	printf("n = %d\n", n % 10);

	return 0;
}
