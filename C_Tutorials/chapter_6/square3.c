#include <stdio.h>

int main(void)
{
	int i, n, odd, square;

	printf("this program prints a table of squares. \n");
	printf("Enter number of entries in table: ");
	scanf("%d", &n);

	i = 1;
	odd = 3;
	for (square = 1; i <= n; odd += 2) {
		printf("%10d%10d\n", i, square);
		i++;
		printf("square = %d, odd = %d\n", square, odd);
		square += odd;
	}

	return 0;
}
