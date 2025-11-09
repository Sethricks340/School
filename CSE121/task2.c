/*
 ============================================================================
 Name        : task2.c
 Author      : Seth Ricks
 Description : Task 02
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>

//Declaring the strcmp function
int strcmp(char one[10], char two[3]);
//Declaring the strlwr function
char strlwr(char string[5]);

//Part 5 of task
int minimum(int value1, int value2){
	//Returns the minimum of two values.

	if (value1 < value2)
	{
		return value1;
	}
	else if (value1 > value2)
		{
			return value2;
		}
	else
		{
			return value1;
		}
}

//Part 4 of task
float min_array(float array[10]){
	//Returns the minimum of an array with ten floats

	float min = array[0];
	int i;
	for (i = 0; i <= 9; i++)
	{
		if (array[i] <= min)
		{
			min = array[i];
		}
	}
	return min;
}

float max_array(float array[10]){
	//Returns the maximum of an array with ten floats

	float max = array[0];
	int i;
	for (i = 0; i <= 9; i++)
	{
		if (array[i] >= max)
		{
			max = array[i];
		}
	}
	return max;
}

float average_array(float array[10]){
	//Returns the average of an array with ten floats

	float sum = 0;
	int i;
	float average;
	for (i = 0; i<= 9; i++)
	{
		sum += array[i];
	}
	average = sum / 10;
	return average;
}

int main(void) {

	int choice = 0;
	int i = 0;
	int value1;
	int value2;
	char more[3];
	float values[9];

	//Part 1 of task
	printf("Welcome to the fruit market!\n");
	printf("Items for purchase:\n");
	printf("1. Lemon\n");
	printf("2. Apple\n");
	printf("3. Banana\n");
	printf("4. Grapes\n");
	printf("5. Orange\n");

	do{
	printf("Input the item number of your choice: ");
	scanf("%d", &choice);

	switch (choice)
	{
	case 1:
		printf("1 Lemon costs $0.58\n");
		break;
	case 2:
		printf("1 Apple costs $1.25\n");
		break;
	case 3:
		printf("1 Banana costs $0.27\n");
		break;
	case 4:
		printf("1 bag of grapes costs $3.74\n");
		break;
	case 5:
		printf("1 orange costs $0.74\n");
		break;
	default:
		printf("Sorry, this was not one of the options. Please try again.\n");
		break;
	}
	printf("Would you like to continue shopping? ");
	scanf(" %s", more);

	//Turns the string stored in more to all lowercase
	strlwr(more);

	//If the user enters yes, the loop restarts and
	//They can enter another product
	}while(strcmp(more, "yes") == 0);


	//Part 2 of task
	printf("\n");
	for (i = 1; i <= 10; i++)
		{
			printf("%d\n", i);
		}

	//Part 3 of task
	printf("\n");
	for (i = 10; i >= 1; i--)
		{
			printf("%d\n", i);
		}

	//Part 4 of task
	printf("Please enter 10 numbers:\n");
	for (i = 0; i <= 9; i++)
		{
			printf("Number %d: ", i + 1);
			scanf("%g", &values[i]);
		}

	printf("The minimum of this list is: %g\n", min_array(values));
	printf("The maximum of this list is: %g\n", max_array(values));
	printf("The average of this list is: %g\n", average_array(values));

	//Part 5 of task
	printf("\n");
	printf("Please enter 2 numbers.\nFirst number: ");
	scanf("%d", &value1);
	printf("Second number: ");
	scanf("%d", &value2);
	printf("The minimum of the two numbers is: %d", minimum(value1, value2));

	while (1){}

	return EXIT_SUCCESS;
}
