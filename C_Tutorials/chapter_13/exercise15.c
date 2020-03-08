#include <stdio.h>
#include <string.h>

int f(char *s, char *t);

int main(void)
{
	char *x = "abcd", *y = "babc";
	int z;
	printf("x = %s\n", x);
	printf("y = %s\n", y);
	z = f(x, y);

	printf("%d\n", z);
	return 0;
}

int f(char *s, char *t)
{
	char *p1, *p2;

	for (p1 = s; *p1; p1++) {
		for (p2 = t; *p2; p2++){
			printf("p1 = %c, p2 = %c\n",*p1, *p2);
			if (*p1 == *p2) 
				break;
		}
		if (*p2 == '\0') break;
	}
	printf("p1 = %s, s = %s\n", p1, s);
	return p1 - s;
}
