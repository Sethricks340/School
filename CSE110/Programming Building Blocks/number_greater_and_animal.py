'''
This is practicing if statements by comparing 
numbers and animals

Seth Ricks
'''

print()
number1 = int(input("Please pick a whole number: "))
number2 = int(input("Please pick another whole number: "))
print()

if number1 > number2:
    print("The first number is greater")
    print("The numbers are not equal")
    print("The second number is not greater")
elif number1 == number2:
    print("The first number is not greater")
    print("The numbers are equal")
    print("The second number is not greater")
elif number1 < number2:
    print("The first number is not greater")
    print("The numbers are not equal")
    print("The second number is greater")
else: 
    print()

print()
animal = input("What is your favorite animal? ")
seth_animal = "monkey"

if animal.lower() == seth_animal:
     print("That's my favorite animal too!")
else: 
     print("That one is not my favorite.")

print()
    