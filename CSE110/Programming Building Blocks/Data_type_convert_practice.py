print()
age = input("How old are you? ")
birthday = int(age) + 1 
print("On your next birthday, you will be " + str(birthday))
print()

cartons = input("How many egg cartons do you have? ")
eggs = int(cartons) * 12
print(f"You have {eggs} eggs")
print()

#print("You have " str(eggs) + " eggs")
#For some reason when I try to use this format 
# and put the number in the middle of the string, it doesn't work. 
# So I think I have to use the f" formatting. 

cookies = input("How many cookies do you have? ")
people = input("How many people are there? ")

cookies_each = int(cookies) / int(people)
print(f"Each person may have {float(cookies_each):.2} cookies.")
print()
