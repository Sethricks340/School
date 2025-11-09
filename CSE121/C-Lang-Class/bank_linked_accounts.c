/*
 ============================================================================
 Name        : bank_linked_accounts.c
 Author      : Seth Ricks
 Description : Task 03, part 2
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>

//Defining the structure of a bank account
typedef struct bank {
	int account;
	char name[15];
	float balance;

	//pointer that makes it possible to link multiple accounts
	struct bank *next;
}bank_t;

void input_account_info(bank_t* bank){
	//User enters in account information, which is then stored in a struct bank
	printf("Enter the account number: ");
	scanf("%d", &bank->account);
	printf("Enter the name of the account: ");
	scanf(" %s", bank->name);
	printf("Enter the balance of the account: ");
	scanf("%g", &bank->balance);
}

void display_account(bank_t* bank){
	//Displays the information of the bank account that was inputed
	printf("\nAccount information:\n");
	printf("Number: %d\n", bank->account);
	printf("Name: %s\n", bank->name);
	printf("Balance: $%g\n", bank->balance);
}

void print_all_accounts(bank_t* bank){

	//creates a new pointer a that equals the pointer bank,
	//and traverses through the different bank accounts to display them all
	struct bank *a = bank;
		while (a != NULL)
		{
			display_account(a);
			//a is assigned to the next next
			a = a->next;
		}
}

int main(void) {

	//allocate memory for the first pointer
	struct bank *b = malloc(sizeof(struct bank));
	b->next = NULL;

	//allocate memory for the second pointer
	struct bank *b2 = malloc(sizeof(struct bank));
	b2->next = NULL;

	//assign the pointer next in the first bank to the second bank structure
	b->next = b2;

	//allocate memory for the third pointer
	struct bank *b3 = malloc(sizeof(struct bank));
	b3->next = NULL;

	//assign the pointer next in the second bank to the third bank structure
	b2->next = b3;

	input_account_info(b);
	input_account_info(b2);
	input_account_info(b3);

	print_all_accounts(b);

	//free the memory that was allocated for the pointers
	free(b);
	free(b2);
	free(b3);

	while (1){}
	return EXIT_SUCCESS;
}
