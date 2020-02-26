#include <stdio.h>

int main(void)
{
	double amount;
	printf("Enter an amount: ");
	scanf("%lf", &amount);
	printf("With tax added: %.2lf\n", amount * 0.05f + amount);
}
