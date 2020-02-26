#include <stdio.h>
#define FORMULA (( 4.0f / 3.0f) * 3.14f)

int main(void)
{
	int radius;

	printf("Please enter the radius of the sphere: ");
	scanf("%d", &radius);

	printf("volume = %.2f\n", radius * radius * radius * FORMULA);
}
