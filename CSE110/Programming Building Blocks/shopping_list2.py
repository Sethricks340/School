"""
Practicing with lists
Another... shopping cart.
-Seth Ricks
"""

print()
the_list = []
item = ""
print("Please enter the items of the shopping list (type quit to finish):  ")

while item != "quit":
    item = input("Item: ")
    if item != "quit":
        the_list.append(item)

print()
print("The shopping list is: ")
for i in the_list:
    print(i)

print()
print("The shopping list with indexes is: ")
for i in range(len(the_list)):
    print(f"{i}. {the_list[i]}")

print()
remove = int(input("Which item would you like to change? "))
new_item = input("What is the new item? ")
the_list[remove] = new_item

print()
print("The shopping list with indexes is: ")
for i in range(len(the_list)):
    print(f"{i}. {the_list[i]}")

print()