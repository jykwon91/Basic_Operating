#include <stdio.h>

int main(void)
{
	int x;

	printf("Enter the number for x: ");
	scanf("%d", &x);

	printf("result = %d\n", 3 * (x*x*x*x*x) + 2 * (x*x*x*x) - 5 * (x*x*x) - (x*x) + 7 * x - 6);
	printf("new result = %d\n", ((((3 * x + 2) * (x - 5)) * (x - 1)) * (x + 7)) * (x - 6));
}
