'''
This is a choose your own adventure story 
meant to help practicecl if-elif-else 
statements.
-Seth Ricks
'''

print()
NAME = input("What is your name? ")
print()

print(f"Your name is {NAME.title()} Heartfield. \
You're living in the middle ages, in a land oppressed by a wicked king. \
You're just minding your own business,\n\
when suddenly you stumble across a mysterious old man in dark robes. \
He's beckoning you over to him!\n")

choice1 = input("Do you IGNORE him, or TALK to him? (Type one of the capitalized words): ")
print()

if choice1.lower() == "ignore":
    print("You decide to ignore him, and go home to continue milking your cows. \
    \nOne of the big ol bessies kicks you in the leg! \
    \nIt's probably broken.") 
    print()
    choice2 = input("Do you YELL for help, or KICK it back? ")
    print()
    if choice2.lower() == "yell":
        print("You decide to yell for help at the top of your lungs. \
        \nYour son comes running into the room with a basket full of eggs \
        \nand spills them all over the floor.")
        print()
        choice3 = input("Do you SCOLD him, or ask him to HELP you? ")
        print()
        if choice3.lower() == "scold":
                print("In your time of need you scolded your son. \
                \nHe decides that he's had enough and runs away from home. \
                \nMaybe you should work on your parenting skills. THE END!")
        elif choice3.lower() == "help":
                print("You ask your son for help and he takes you to the hospital. \
                \nIt's going to cost a fortune, but you're going to be okay. THE END!")
        else:
            print("Sorry that's not one of the options. Please start over.")
    elif choice2.lower() == "kick":
            print("In your rage you unwisely decided to kick the cow back… \
            \nit just stares at you. Your leg heals.") 
            print()
            choice4 = input("Later, do you SELL the cow or EAT it? ")
            if choice4.lower() == "sell":
                print()
                print("So you sold the cow. Now you can enjoy all the extra money \
                \nand finally build that fence you've been wanting to get to. THE END!")
            elif choice4.lower() == "eat":
                print()
                print("Get out your rifle because it's time for burgers! \
                \nYou invite the whole neighborhood over and have a party. THE END!")
            else:
                print("Sorry that's not one of the options. Please start over.")
    else:
        print("Sorry that's not one of the options. Please start over on.")
elif choice1.lower() == "talk":
    print("It makes you a little nervous, but you decide to try talking to the man. \
    \nHe tells you that he is a wizard! He proves it by showing you a bit of magic- suddenly a golden sword and a rubber duck appear out of thin air! \
    \nYou are to choose one to use on your quest to stop the evil king.") 
    print()
    choice5 = input("Do you choose the SWORD or the DUCK? ")
    print()
    if choice5.lower() == "sword":
        print("You choose the sword, duh, and in the blink of an eye you are transported to a dark cave! \
        \nYou hear a deep rumbling sound… It's a dragon!!")
        print()
        choice6 = input("Do you RUN away or CHARGE at it? ")
        print()
        if choice6.lower() == "run":
            print("You run out of the cave and fall off a cliff! That's unfortunate. THE END!")
        elif choice6.lower() == "charge":
            print("Why did you charge at a giant, fully-grown dragon? \
            \nAre you trained? Have you done this before? \
            \nYeah that thing roasted you to powder in a matter of seconds. Whoops. THE END!")
        else:
            print("Sorry that's not one of the options. Please start over.")
    elif choice5.lower() == "duck":
        print("You chose the rubber duck? Okay… Woah! \
        \nYou're transported straight to the king's court!")
        print()
        choice7 = input("Do you DENOUNCE him, KNEEL before him, or THROW the duck at him? ")
        print()
        if choice7.lower() == "denounce":
            print("You denounce the king in his own court. \
            \nYou cite before him all the evil he has done towards the humble people of the land, \
            \nand that he must relinquish his throne... or else! \
            \nOne of the king's guards comes up behind you and ends that real quick. Well that didn't go well. THE END!")
        elif choice7.lower() == "kneel":
            print("You kneel before the king and show reverence for his majesty. \
            \nHe has pity on you and decides to make you a deal. \
            \nHe will give up the throne and once again return the long-lost peace to the land, \
            \nif you can guess his name.")
            print()
            choice8 = input("What is your guess? ")
            print()
            if choice8.lower() == NAME.lower():
                print("Wow you have the same name?? Twinsies! Peace is restored and the land once again begins to prosper. Well done! THE END!")
            else: 
                print("That's not right. The king throws you in the prison, where you spend the rest of your life. Oh well. THE END!")
        elif choice7.lower() == "throw":
            print("For some reason you throw the rubber duck at him? \
            \nHe promptly catches it, and starts crying! It turns out that it is his long lost toy from childhood! \
            \nThe king's evil heart is softened and the land is rid of his tyranny, once again restoring peace. You did it! THE END.")
        else:
            print("Sorry that's not one of the options. Please start over.")
    else:
        print("Sorry that's not one of the options. Please start over.")
else:
    print("Sorry that's not one of the options. Please start over.")
print()