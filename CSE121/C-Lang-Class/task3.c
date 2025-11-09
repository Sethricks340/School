/*
 ============================================================================
 Name        : task03.c
 Author      : Seth Ricks
 Description : Task 03
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>

void pass_by_value(int value)
{
	//This function allows the user to pass a variable in by value
	value += 3;
	printf("The value is now %d\n", value);
}

void pass_by_reference(int* value)
{
	//This function allows the user to pass a variable in by reference
	*value += 3;
	printf("The value is now %d\n", *value);
}

int main(void) {
	//Create variable value and an example pointer
	int value;
	int* example_pointer = NULL;
	example_pointer = &value;

	printf("Enter an integer: ");
	scanf("%d", &value);

	//The function with that passes by value doesn't change the variable in
	//memory, but pass by reference does. This is super useful when wanting to create
	//a function that actually changes a specific value.
	pass_by_value(value);
	printf("The value after the pass_by_value function is: %d\n", value);
	pass_by_reference(example_pointer);
	printf("The value after the pass_by_reference function is: %d\n", value);

	while (1){}
	return EXIT_SUCCESS;
}
