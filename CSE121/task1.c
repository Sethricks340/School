/*
 ============================================================================
 Name        : task1.c
 Author      : Seth Ricks
 Description : Task 01
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>

int main(void) {
	//We learned how declare variable types
	int i;
	int a;
	int b;
	float j;
	char name[15];

	//Print the prompt
	printf("Enter a number: ");
	//Take user input as an integer
	scanf("%d", &i);
	//Print resulting string
	printf("The number you entered is %d\n", i);

	//Print the prompt
	printf("Enter a float: ");
	//Take user input as a float
	scanf("%f", &j);
	//Print results in different desired formats
	printf("Fixed point: %f\n",j);
	printf("Scientific: %e\n",j);
	printf("Shortest representation: %g\n", j);

	printf("Enter a word (less than 15 letters): ");
	//Don't need to pass in the address of an array, just the name to scanf

	//Take user input as a string
	scanf(" %s", name);
	printf("The word is %s\n", name);

	//Two numbers are prompted and stored
	printf("Please enter two numbers:\n");
	printf("First number: ");
	scanf("%d", &a);
	printf("Second number: ");
	scanf("%d", &b);

	//If statements to determine how the numbers compare
	if (a < b)
	{
		printf("%d is less than %d\n", a, b);
	}

	else if (b < a)
		{
			printf("%d is less than %d\n", b, a);
		}

	else if (b == a)
		{
			printf("%d is equal to %d\n", a, b);
		}


	while (1) {}

	return EXIT_SUCCESS;
}
