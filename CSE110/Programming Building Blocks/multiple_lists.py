"""
Practicing multiple lists 
-Seth Ricks
"""

account_names = []
account_balances = []

print("Enter the names and balances of bank accounts (type quit when done) ")

name = ""
again = "yes"
while again == "yes":
    while name != "quit":

        name = input("What is the name of this account? ")
        if name != "quit":

            account_names.append(name)

            balance = float(input("What is the balance? "))
            account_balances.append(balance)

    print()
    print("Account Information: ")
    for i in range(len(account_balances)):
        print(f"{i + 1}. {account_names[i]} - ${account_balances[i]:.2f}")

    print()
    print(f"Total: ${sum(account_balances):.2f}")
    print(f"Average: ${(sum(account_balances)) / len(account_names):.2f}")

    greatest = max(account_balances)
    i = account_balances.index(greatest)
    number = account_names[i]
    print(f"Highest balance: {number} - ${greatest:.2f}")

    again = input("Do you want to update an account? ")
    if again == "yes".lower():

        change = int(input("What account index do you want to update? "))

        new_amount = float(input("What is the new amount? "))

        account_balances[change - 1] = new_amount