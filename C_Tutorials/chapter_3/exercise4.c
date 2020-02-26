#include <stdio.h>

int main(void)
{
	int i,j;
	float x;

	scanf("%d %f %d", &i, &x, &j);
	//output of 10.3 5 6
	//8, 0.300000, 5
	printf("%d, %f, %d\n", i, x, j);

	scanf("%d%f%d", &i, &x, &j);
	printf("%d, %f, %d\n", i, x, j);

	return 0;
}
