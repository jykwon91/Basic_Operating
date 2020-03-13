#include <ctype.h>
#include <stdbool.h>
#include <stdio.h>

int main(void)
{
	bool nonblank_seen = false;
	int ch;

	while ((ch = getchar()) != EOF) {
		if (nonblank_seen)
			putchar(ch);
		else if (!isspace(ch)) {
			nonblank_seen = true;
			putchar(ch);
		}
		if (ch == '\n')
			nonblank_seen = false;
	}

	return 0;
}
