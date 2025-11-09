'''
This is practicing if-elif-else statements 
by calculating grades. 
Seth Ricks
'''

print()
grade = float(input("Please enter your grade percentage: "))

if grade >= 90:
    letter = "A"
elif grade >= 80:
    letter = "B"
elif grade >= 70:
    letter = "C"
elif grade >= 60:
    letter = "D"
else:
    letter = "F"

if letter in("A" , "F"):
    article = "an"
else:
    article = "a"

remainder = grade % 10 

if letter in ("B" , "C" , "D"):
    if remainder >= 7:
        sign = "+"
        print(f"You have {article} {letter}{sign}.")
    elif remainder < 3:
        sign = "-"
        print(f"You have {article} {letter}{sign}.")
    else:
        print(f"You have {article} {letter}.")
elif letter == "A":
    if remainder < 3 and remainder > 0:
        sign = "-"
        print(f"You have {article} {letter}{sign}.")
    else:
        print(f"You have {article} {letter}.")
else: 
    print(f"You have {article} {letter}.")


if grade < 70:
    print("You are not passing the class.")
else:
    print("You are passing the class!")
print()