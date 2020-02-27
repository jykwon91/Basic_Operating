#include <stdio.h>

int main(void)
{
	// create a pointer to a char and point it to the first text cell
	// of video memory (o.e. the top left of the screen)
	char* video_memory = (char*) 0xb8000;
	// at the address pointed to by video_memory, store the character 'X'
	// (i.e. display 'X' in the top left of the screen
	*video_memory = 'X';
}
