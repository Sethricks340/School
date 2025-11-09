'''
This calculates the price of a meal. 
Seth Ricks
'''

print()
print("Welcome to Python eats, \nthe only restaurant in town \nthat let's you pick the prices you want!")
print()
child_meal = input("What is the price of a child's meal? $")
adult_meal = input("What is the price of an adult's meal? $")
children = input("How many children are there? ")
adults = input("How many adults are there? ")
sales_tax = input("What is the sales tax rate? %")
drink = float(input("How much is a drink? $"))
drink_price = int(input("How many drinks would you like? "))
drink_total = drink_price * drink 
tip = float(input("Would you like to leave a tip? Tip amount: $"))
pay_amount = float(input(f"What is the payment amount? $"))

print()
print("Order number 304:")
print("-" * 40)
print(f"Child meal(s): {children}")
print(f"Adult meal(s): {adults}")
print(f"Drink(s): {drink}")

subtotal = (float(child_meal) * int(children )) + (float(adult_meal) * int(adults)) + (float(drink_total))
print()
print(f"Subtotal: ${subtotal:.2f}")
tax = ((float(sales_tax) / 100 ) * subtotal)
print(f"Sales Tax: ${tax:.2f}")
print(f"Tip: ${tip:.2f}")

total = subtotal + tax + tip
print(f"Total: ${total:.2f}")
print(f"Payed with ${pay_amount:.2f}")
change = float(pay_amount) - total
print(f"Change: ${change:.2f}")
print()
code = "Order code: 482940579"
print("Thank you! Go to www.pythonsweepstakes.com and \nenter the code at the bottom of this receipt \nfor a chance to win 1,000,000 pesos!")
print(f"       {code:10}")
print("-" * 40)
print()