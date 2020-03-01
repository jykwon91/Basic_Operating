#include <stdio.h>

int main(void)
{
	int num;
	printf("This program prints a table of squares.\nEnter number of entries in the table: ");
	scanf("%d", &num);

	int count = 1;
	while (count != num+1)
	{
		printf("%d          %d\n", count, count*count);
		count++;	
	}

	return 0;
}
