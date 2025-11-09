"""
Learning functions
-Seth Ricks
"""
#Give someone's initials
"""
def get_initial(name):
    initial = name[0:1]
    return initial.upper()

first_name = input("Enter you first name: ")
first_name_initial = get_initial(first_name)

last_name = input("Enter you last name: ")
last_name_initial = get_initial(last_name)

print(f"Your initials are {first_name_initial}.{last_name_initial}.")

#or

print(f"Your initials are {get_initial(first_name)}.{get_initial(last_name)}.")
"""


#parameters for functions
def get_initial(name, force_uppercase = True): #Default value
    if force_uppercase:
        initial = name[0:1].upper()
    else:
        initial = name[0:1]
    return initial

first_name = input("Enter your first name: ")
last_name = input("Enter your last name: ")

print(f"Your initial is: {get_initial(first_name)}") #default is true so its upper
print(f"Your initial is: {get_initial(last_name, False)}")

#named notation: 
get_initial(force_uppercase = True , name = first_name)