"""
This is an imitation of the 
"Wordle" game.
-Seth Ricks
"""

import random

print()
word = ""
guess = ""
play = True
count = 0
print("Welcome to Wordle! Try to guess the 5-letter secret word. Letters guessed correctly \
AND in the correct position are printed with an uppercase. \nLetters guessed correctly \
but NOT in the correct position are printed with a lowercase. (Type 'stop' at any time to quit.) Let's get started!")
print()
print("Your hint is _ _ _ _ _")
guess = input("What is your guess? ")

while play == True:

    magic = random.randint(1,10)

    if magic == 1:
        word = "horse"
    elif magic == 2:
        word = "jazzy"
    elif magic == 3:
        word = "cages"
    elif magic == 4:
        word = "mound"
    elif magic == 5:
        word = "hairy"
    elif magic == 6:
        word = "happy"
    elif magic == 7:
        word = "alone"
    elif magic == 8:
        word = "until"
    elif magic == 9:
        word = "alive"
    elif magic == 10:
        word = "allow"

    length = len(word)

    while (guess.lower() != word.lower()) and guess.lower() != "stop":
        if len(guess) == len(word):
            print("Sorry, your guess was not correct.")
            print("Your hint is: " , end = "")
            
            for index in range(length):
                letter = word[index].lower()
                letter2 = guess[index].lower()

                if letter.lower() != letter2.lower():
                    ya_lo_hice = False
                    for j in range(length):
                        letter3 = word[j].lower() 
#Or you could use the "in" function
                        if letter2 == letter3 and ya_lo_hice == False:
                            print(f"{letter2.lower()} " , end= "")
                            ya_lo_hice = True

                    if not ya_lo_hice:
                        print("_ " , end = "")

                elif letter == letter2:
                    print(f"{letter.upper()} " , end = "")

            count += 1
            guess = input("\nWhat is your guess? ")
        
        else:
            print("Sorry, your guess must have the same number of letters as the secret word.")
            print("Your hint is _ _ _ _ _")
            count += 1
            guess = input("What is your guess? ")

    count += 1
    if guess.lower() != "stop":
        if count != 1:
            print(f"You guessed it! It took you {count} tries.")
        else:
            print(f"You guessed it! It took you {count} try.")

        play = input("Would you like to play again? ")
        if play.lower().count("y") == 1: #the user can type yes or y
            play = True
            print()
            print("Your hint is _ _ _ _ _")
            guess = input("What is your guess? ")
            count = 0

        else:
            play = False
    else:
        print()
        play = False

print("Play again soon!")
print()