#include <stdio.h>

int main(void)
{
	int digits = 0, num;

	printf("Enter a nonnegative integer: ");
	scanf("%d", &num);

	do {
		num /= 10;
		digits++;
	} while (num > 0);

	printf("the number has %d digit(s).\n", digits);

	return 0;
}
