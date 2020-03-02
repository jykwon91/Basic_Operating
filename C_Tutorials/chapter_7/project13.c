#include <stdio.h>
#include <ctype.h>

int main(void)
{
	int word = 0, charCount = 0;
	char ch;

	printf("Enter a sentence: ");

	while ((ch = getchar()) != '\n')
		switch(ch) {
			case ' ': case '.':
				word += 1;
				break;
			default:
				charCount += 1;
				break;
		}
	printf("word = %d\n", word);
	printf("charCount = %d\n", charCount);
	printf("Average word length: %.1f\n",  (double) charCount / word);
}
