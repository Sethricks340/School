'''
This determines if the user is able 
to ride the given amusement park 
actraction. Practicing if-elif-else statements.
-Seth Ricks
'''

print()
age1 = float(input("What is the age of the first rider? "))
height1 = float(input("What is the height of the first rider (in inches)? "))
second_rider = input("Is there a second rider (yes/no)? ")

ride = False

if second_rider.lower() == "yes":
    age2 = float(input("What is the age of the second rider? "))
    height2 = float(input("What is the height of the second rider (in inches)? "))
    if height1 < 36 or height2 < 36:
        ride = False
    elif age1 >= 18 or age2 >= 18:
        ride = True
    elif age1 < 18 and age2 < 18:
        if age1 >= 12 and age2 >= 12 and height1 >= 52 and height2 >= 52:
            ride = True
        elif (age1 >= 16 and age2 >= 14) or (age1 >= 14 and age2 >= 16):
            ride = True 
        elif age1 >= 12 or age2 >= 12:
            VIP = input("Does one of the riders have a golden passport (yes/no)? ")
            if VIP.lower() == "yes":
                ride = True
            else:
                ride = False
elif second_rider.lower() == "no":
    if height1 >= 62 and age1 >= 18:
        ride = True
    elif height1 >= 62 and age1 < 18 and age1 >= 12:
        VIP = input("Do you have a golden passport (yes/no)? ")
        if VIP.lower() == "yes":
            ride = True
        else:
            ride = False
    else:
        ride = False

if ride:
    print("Welcome to the ride. Please be safe and have fun!")
else:
    print("Sorry, you may not ride.")