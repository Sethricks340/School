/*
 ============================================================================
 Name        : family_tree.c
 Author      : Seth Ricks
 Description : Task 06 final project
 This program imitates creating a family tree. For simplicity, every person only has a name, ID, father, mother, and max 4 children.
 The user has the option to add a person, display information of a person, add person relationships, and quit.
 The persons are added to a list, and are utilized according to the inputed "ID number"
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>

//Defining the structure of a person
typedef struct person {
	//For simplicity, each person only has a name, ID, father, mother, and max 4 children
	int ID;
	char name[30];
	struct person *mother;
	struct person *father;
	struct person *child1;
	struct person *child2;
	struct person *child3;
	struct person *child4;
}person_t;

void input_person_ID(person_t* person){
	//User enters in person's name, which is then stored in a struct person->name
	printf("Enter person name: ");
	scanf(" %[^\n]", person->name);
	printf("Enter person ID number: ");
	scanf("%d", &person->ID);

	//elements of the rest of each person are initialized to be NULL for further use
	person->mother = NULL;
	person->father = NULL;
	person->child1 = NULL;
	person->child2 = NULL;
	person->child3 = NULL;
	person->child4 = NULL;
}

struct person* input_person_family(person_t* person){
	int choice;
	printf("What would you like to enter?\n");
	printf("1. Mother\n2. Father\n3. Child\n");
	printf("(Please enter 1,2,3)\n");
	printf("Your choice: ");
	scanf("%d", &choice);

	//function has to return a person, so if nothing happens it defaults to returning a NULL person
	struct person *relative = NULL;

	//to enter mother
	if (choice == 1){
		struct person *mother = malloc(sizeof(struct person));;
		input_person_ID(mother);
		person->mother = mother;
		relative = mother;
	}

	//to enter father
	else if (choice == 2){
		struct person *father = malloc(sizeof(struct person));
		input_person_ID(father);
		person->father = father;
		relative = father;	}

	//to enter child
	else if (choice == 3){

		if (person->child1 == NULL){
			struct person *child = malloc(sizeof(struct person));;
			input_person_ID(child);
			person->child1 = child;
			relative = child;		}

		else if (person->child2 == NULL){
			struct person *child = malloc(sizeof(struct person));;
			input_person_ID(child);
			person->child2 = child;
			relative = child;		}

		else if (person->child3 == NULL){
			struct person *child = malloc(sizeof(struct person));;
			input_person_ID(child);
			person->child3 = child;
			relative = child;		}

		else if (person->child4 == NULL){
			struct person *child = malloc(sizeof(struct person));;
			input_person_ID(child);
			person->child4 = child;
			relative = child;		}

		//if the user tries to enter more than 4 children for one person, relative returned is NULL as initialized
		else{
			printf("Sorry, the max is four children.\n");
		}
	}
	return relative;
}

void display_person_info(person_t* person){
	//Displays the information of the person that was inputed
	printf("\nPerson information:\n");
	printf("Person ID: %d\n", person->ID);
	printf("Person name: %s\n", person->name);

	//Display whatever information is known for a given person
	if (person->mother != NULL){
		printf("Mother: %s\n", person->mother->name);
	}

	if (person->father != NULL){
		printf("Father: %s\n", person->father->name);
	}

	if (person->child1 != NULL){
		printf("Child: %s\n", person->child1->name);
	}

	if (person->child2 != NULL){
		printf("Child: %s\n", person->child2->name);
	}

	if (person->child3 != NULL){
		printf("Child: %s\n", person->child3->name);
	}

	if (person->child4 != NULL){
		printf("Child: %s\n", person->child4->name);
	}
}

int main(void) {

	//variables used throughout the switch statements to navigate the family tree
	int i;
	int ID;
	int done = 0;
	int people_count = 0;
	int choice = 7;

	//create a list of people to store and navigate through in one place
	struct person *people[20];

	//set each person in the list initially to NULL
	//max 20 people
	for (i = 0; i < 20; i++)
		{
			people[i] = NULL;
		}

	while (choice != 0){
	printf("\nMain menu:\n1. Add Person\n2. Display Person\n3. Add Person's Parents and Children\n0. Quit Program\nYour choice: ");
	struct person *new_person = malloc(sizeof(struct person));

	scanf("%d", &choice);

	switch (choice)
	{
		//Add Person
		case 1:

			if (people_count < 20){
			input_person_ID(new_person);
			people[people_count] = new_person;
			people_count += 1;
			}

			//when the list is full!
			else{
				printf("Sorry, you've reached the people input limit\n");
			}

			break;

		//Display Person
		case 2:

			done = 0;
			printf("What is the ID number of the person? ");
			scanf("%d", &ID);

			//If nobody has been entered in yet
			if (people_count == 0){
				printf("\nSorry, this person does not exist.\n");
				done = 1;
			}

			else{

				//for every person in the list
				for (i = 0; i < 20; i++)
					{
						//if there is a person in the index
						if (people[i] != NULL){
							//if the ID enters matches the person's ID
							if (ID == people[i]->ID)
							{
								display_person_info(people[i]);
								done = 1;
							}
						}
					}
			}

			if (done == 0)
			{
				printf("\nSorry, this person does not exist.\n");
			}

			break;

		//Input Person's Parents and Children
		case 3:

			done = 0;
			printf("What is the ID number of the person? ");
			scanf("%d", &ID);

			//for every person in the list
			for (i = 0; i < 20; i++)
				{
					//if the person exists
					if (people[i] != NULL){
						if (ID == people[i]->ID && done == 0)
						{
							//confirmation of who the person is
							printf("The name of this person is: %s\n", people[i]->name);
							struct person* new;
							new = input_person_family(people[i]);
							done = 1;

							if (new != NULL){
							people[people_count] = new;
							people_count += 1;
							}
						}
					}
				}

			if (done == 0)
				{
					printf("\nSorry, this person does not exist.\n");
				}

			break;

		//Quit Program
		case 0:
			break;
		}
	}

	//free the list of people
	for (i = 0; i < 10; i++)
		{
			free(people[i]);
		}

	return EXIT_SUCCESS;
}
