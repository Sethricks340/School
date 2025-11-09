/*
 ============================================================================
 Name        : bank_account.c
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
	printf("Balance: %g\n", bank->balance);
}

int main(void) {

	//Defining a bank structure
	struct bank personal_bank;

	//Defining a pointer that points to the bank structure
	struct bank* bank_pointer = NULL;
	bank_pointer = &personal_bank;

	input_account_info(bank_pointer);

	display_account(bank_pointer);

	while (1){}
	return EXIT_SUCCESS;
}
