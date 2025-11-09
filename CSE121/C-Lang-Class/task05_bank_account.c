/*
 ============================================================================
 Name        : task05_bank_account.c
 Author      : Seth Ricks
 Description : Task 05
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
	//choice is set to an int that is not one of the options
	int choice = 7;

	//first record doesn't exist yet
	struct bank *head = NULL;

	//loop that continues until the user enters 0 to quit
	while (choice != 0){
	printf("\nMain menu:\n1. Add Account\n2. Display all accounts\n3. Find account\n4. Update Account\n0. Quit program\nYour choice: ");

	//new record memory allocated
	struct bank *new_account = malloc(sizeof(struct bank));

	scanf("%d", &choice);

	switch (choice)
	{
		//Add account
		case 1:

			//if first record doesn't exist yet
			if (head == NULL)
			{
				//the first record is now the inputed account
				input_account_info(new_account);
				head = new_account;
				head->next = NULL;
			}

			else
			{
				//tail created to point to the last record in the linked list
				struct bank *tail = head;
				//Loop through the linked accounts in order
				//to find the account whose "next" == NULL
				while (tail->next != NULL)
					{
						tail = tail->next;
					}

				//tail set to the inputed account
				input_account_info(new_account);
				tail->next = new_account;
				new_account->next = NULL;
			}

			break;

		//display all accounts
		case 2:
			//print all of the accounts using display_all_accounts
			print_all_accounts(head);
			break;

		//find account
		case 3:{
			//variable to stop the infinite loop
			int end = 0;
			int account_number;
			printf("Enter the account number: ");
			scanf("%d", &account_number);

			//if the first record doesn't exist, then there aren't any accounts to search for
			if (head == NULL){
				printf("\nSorry, this account does not exist.\n");
			}

			else{

			//loop to find a record whose account number matches the one inputed
			struct bank *tail = head;
			while (tail->account != account_number && end == 0)
				{
					if (tail->next == NULL){
						//if the loop has gone through the whole list without finding the correct account number
						printf("\nSorry, this account does not exist.\n");
						end = 1;
					}

					else{
						tail = tail->next;
					}
				}

			//if the account number was found
			if (tail->account == account_number){
				display_account(tail);
			}
		}

			break;
		}

		//update account
		case 4:{
			int account_number;
			int end = 0;
			printf("Enter account number to update: ");
			scanf("%d", &account_number);

			//if the first record doesn't exist
			if (head == NULL){
				printf("\nSorry, this account does not exist.\n");
			}

			else{
				//same as block 3
				struct bank *tail = head;
				while (tail->account != account_number && end == 0)
					{
						if (tail->next == NULL){
							printf("\nSorry, this account does not exist.\n");
							end = 1;
						}

						else{
							tail = tail->next;
						}
					}

				//instead of displaying the account like in block 3, the user can update the account
				if (tail->account == account_number){
					input_account_info(tail);
				}
				}
			}
			break;

		//quit
		case 0:
			break;

		default:
			printf("\nSorry, try again.\n");
			break;
		}

	}
	return EXIT_SUCCESS;
}
