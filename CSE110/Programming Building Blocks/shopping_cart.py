"""
This simulates a shopping cart 
-Seth Ricks
"""

print()
print("Welcome to the Shopping Cart Program!")
items = []
prices = []
selection = 0
is_number = False
is_number2 = False
ya_lo_hice = False

while selection != "5":
    print("Please select one of the following: \n1. Add item \n2. View Cart \n3. Remove item \n4. Compute total \n5. Quit")
    selection = input("Please enter an action: ")
    if selection in ("1", "2", "3", "4", "5"):
        if selection == "1":
            ya_lo_hice = False
            item = input("What item would you like to add? ")
            items.append(item)
            price = input(f"What is the price of '{item}'? (don't put $ sign) " )
            is_number = False

            while not is_number:
                ya_lo_hice = False
                for i in range(len(price)):
                    if (price[i].isnumeric() or price[i] == "." or price[i] == " ") and ya_lo_hice == False:
                        is_number = True

                    else:
                        is_number = False
                        ya_lo_hice = True

                if price.count(".") > 1:
                        is_number = False
                if price.count("$") > 1:
                        is_number = False 

                if is_number:
                    print(f"'{item}' has been added to the cart. ")
                    price = float(price)
                    prices.append(price)
                    print()
                else: 
                    print(f"Sorry, '{price}' is not a a valid number. ")
                    price = input(f"What is the price of '{item}'? " )

        if selection == "2":
            print("The contents of the shopping cart are: ")
            for i in range(len(items)):
                print(f"{i + 1}. {items[i]} - ${prices[i]:.2f}")
            print()
        if selection == "3":
            if len(items) == 0:
                print("Sorry, there aren't any items on your shopping list.")
                print()
            else:
                remove = input("What item would you like to remove? ")
                is_number2 = False
                
                while not is_number2:
                        is_number2 = True

                        for i in range(len(remove)):

                            if not (remove[i].isnumeric() or remove[i] == " "):
                                is_number2 = False

                        if is_number2:
                            if int(remove) > (len(items)) or (int(remove) <= 0):
                                is_number2 = False

                        if is_number2:
                            remove = int(remove)
                            items.pop(remove - 1)
                            prices.pop(remove - 1)
                            print("Item removed.")
                            print()

                        else:
                            print("Sorry that is not a valid entry.")
                            remove = input("What item would you like to remove? ")
                
        if selection == "4":
            print(f"The total price of the items in the shopping cart is ${sum(prices):.2f}")
            print()
    else:
        print()
        print("Sorry that is not a valid entry.")
        print()
            
print("Thank you. Goodbye. ")

#should I add a checkout option?
#"Try and except" instead of all the boolean variables