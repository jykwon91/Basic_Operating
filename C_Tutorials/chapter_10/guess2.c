#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define MAX_NUMBER 100

/* prototypes */
void initialize_number_generator(void);
void choose_new_secret_number(void);
void read_guesses(int secret_number);
int new_secret_number(void);

int main(void)
{
	char command;
	int secret_number;

	printf("Guess the secret number bteween 1 and %d.\n\n", MAX_NUMBER);
	initialize_number_generator();
	do {
		secret_number = new_secret_number();
		printf("A new number has been chosen.\n");
		read_guesses(secret_number);
		printf("Play again? (Y/N) ");
		scanf(" %c", &command);
		printf("\n");
	} while (command == 'y' || command == 'Y');

	return 0;
}

/************************************************************
 * initialize_number_generator: initializes the random		*
 * 				number generator using		*
 * 				the time of dau.		*
 ***************************************************************/
void initialize_number_generator(void)
{
	srand((unsigned) time(NULL));
}

/******************************************************
 * choose_new_secret_number:	randomly selected a number *
 * 				between 1 and MAX_NUMBER and *
 * 				stores it in secret_number. *
 ********************************************************/
/*
void choose_new_secret_number(void)
{
	secret_number = rand() % MAX_NUMBER + 1;
}
*/
/* new_secret_number: returns a randomly chosen number
 * 			between 1 and MAX_NUMBER
 * 			*/
int new_secret_number(void)
{
	return rand() % MAX_NUMBER + 1;
}

/****************************************
 * read_guesses: Repeatedly reads user guesses and tells *
 * 		 the user whether each guess is too low,
 * 		 too high, or correct. when the guess is
 * 		 correct, prints the total number of
 * 		 guesses and returns.
 *************************************************************/
void read_guesses(int secret_number)
{
	int guess, num_guesses = 0;

	for (;;) {
		num_guesses++;
		printf("Enter guess: ");
		scanf("%d", &guess);
		if (guess == secret_number) {
			printf("You won in %d guesses!\n\n", num_guesses);
			return;
		} else if (guess < secret_number)
			printf("Too low, try again.\n");
		else
			printf("Too high; try again.\n");
	}
}
