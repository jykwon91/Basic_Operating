/* Converts a Fahrenheit temperature to Celsius */

#include <stdio.h>

#define FREEZING_PT 32.0f
#define SCALE_FACTOR (5.0f / 9.0f)

int main(void)
{
	float fahrenheit, celsius;

	printf("Enter Fahrenheit temperature: ");

	scanf("%f", &fahrenheit);

	celsius = (fahrenheit - FREEZING_PT) * SCALE_FACTOR;

	printf("Celsius equivalent: %.1f\n", celsius);

	return 0;
}

//notes
// GCC - GNU C compiler now stands for gnu compiler collection
// GNU - GNU's not unix
// linux - "kernel" of the operating system(handles scheduling and basic I/O services
// -Wall - causes compiler to produce warning messages when it detects possible errors
// -Wall = "all -W options"
// -pedantic - issues all warnings required by C standard
// -ansi - turns off features of gcc that aren't standard c and enables a few standard features that are normally disabled
// -std = c89
// -std = c99 - specifies which version of C the compiler should use to check the program
// float - "floating-point" technique for storing numbers in which the decimal point "floats"
// float parts stored in two parts: fraction(or mantissa) and the exponent
// number 12.0 might be stored as 1.5 x 2^3
//
