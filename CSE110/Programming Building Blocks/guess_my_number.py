"""
Game where the user guesses a random number
-Seth Ricks
"""

import random
magic = random.randint(1,10)

print("\nWelcome to number guesser! ")
count = 0
play = True

while play == True:
    guess = int(input("Guess a number 1-100: "))
    while magic != guess:
        if magic > guess:
            print("Higher")
            guess = int(input("Guess a number 1-100: "))
            count += 1
        if magic < guess:
            print("Lower")
            guess = int(input("Guess a number 1-100: "))
            count += 1
    print("You guessed it!")
    count += 1
    if count == 1:
        print(f"You guessed it in {count} try!")
    else:
        print(f"You guessed it in {count} tries!")
    play = input("Would you like to play again? (y/n) ")
    if play.lower().count("y") == 1: #the user can type yes or y
        guess = 0
        count = 0
        magic = random.randint(1,100)
        play = True
    else:
        play = False

print("Come back soon!")