"""
This is practicing while loops, 
-Seth Ricks
"""

print()

number = 0

number = float(input("Please type a positive integer: "))

while number < 0 or ((number - (number // 1)) > 0):
    if number < 0 and ((number -(number // 1)) > 0):
        print("That is a negative number AND not an integer. FOLLOW DIRECTIONS!!")
        number = float(input("Please type a positive integer: "))
    elif ((number -(number // 1)) > 0):
        print("Sorry, that is not an integer.")
        number = float(input("Please type a positive integer: "))
    elif number < 0:
        print("Sorry, that is a negative number. Please try again.")
        number = float(input("Please type a positive integer: "))

print(f"The number is: {number:.0f}")


candy = input("May I have a piece of candy? ")

while candy.lower() not in("yes" , "sure", "okay", "why not" , "okay fine"):
    candy = input("May I have a piece of candy? ")

print("Thank you.")