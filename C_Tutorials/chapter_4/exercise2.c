#include <stdio.h>

int main(void)
{
	int i=9, j=7;

	printf("(-%d)/%d = %d\n", i, j, (-i)/j);
	printf("-(%d/%d) = %d\n", i, j, -(i/j));
	printf("-(%d/%d) = %d\n", i, j, (-i/j));

	return 0;
}
