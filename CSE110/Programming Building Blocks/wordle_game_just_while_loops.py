"""
This is an imitation of the 
"Wordle" game, only using while loops.
-Seth Ricksdog
"""

import random  

k = "_"
l = "_"
m = "_"
n = "_"
o = "_"
guess = ""

print()
print("Welcome to Wordle! Try to guess the 5-letter secret word. Letters guessed correctly \
AND in the correct position are printed with an uppercase. \nLetters guessed correctly \
but NOT in the correct position are printed with a lowercase. Let's get started!")
print()
print("Your hint is _ _ _ _ _")
guess = input("What is your guess? ")
num = 0
play = True
while play == True:
    magic = random.randint(1,10)

    if magic == 1 :
        a,b,c,d,e = "horse"
        word = "horse"
    elif magic == 2:
        a,b,c,d,e = "jazzy"
        word = "jazzy"
    elif magic == 3:
        a,b,c,d,e = "cages"
        word = "cages"
    elif magic == 4:
        a,b,c,d,e = "mound"
        word = "mound"
    elif magic == 5:
        a,b,c,d,e = "hairy"
        word = "hairy"
    elif magic == 6:
        a,b,c,d,e = "slash"
        word = "slash"
    elif magic == 7:
        a,b,c,d,e = "alone"
        word = "alone"
    elif magic == 8:
        a,b,c,d,e = "until"
        word = "until"
    elif magic == 9:
        a,b,c,d,e = "alive"
        word = "alive"
    elif magic == 10:
        a,b,c,d,e = "allow"
        word = "allow"   

    while guess.lower() != word.lower():
        if len(guess) == len(word):
            f,g,h,i,j = guess
            if guess.lower().count(a) > 0: 
                if a == f.lower(): 
                    k = a.capitalize()
                if a == g.lower(): 
                    l = a.lower()
                if a == h.lower():
                    m = a.lower()
                if a == i.lower():
                    n = a.lower()
                if a == j.lower():
                    o = a.lower()
            if guess.lower().count(b) > 0: 
                if b == f.lower() and a != f.lower():
                    k = b.lower()
                if b == g.lower():
                    l = b.capitalize()
                if b == h.lower():
                    m = b.lower()
                if b == i.lower():                       
                    n = b.lower()
                if b == j.lower():
                    o = b.lower()
            if guess.lower().count(c) > 0: 
                if c == f.lower() and a != f.lower():
                    k = c.lower()
                if c == g.lower() and b != g.lower():
                    l = c.lower()
                if c == h.lower():
                    m = c.capitalize()
                if c == i.lower():
                    n = c.lower()
                if c == j.lower():
                    o = c.lower()
            if guess.lower().count(d) > 0: 
                if d == f.lower() and a != f.lower():
                    k = d.lower()
                if d == g.lower() and b != g.lower():
                    l = d.lower()
                if d == h.lower() and c != h.lower():
                    m = d.lower()
                if d == i.lower():
                    n = d.capitalize()
                if d == j.lower():
                    o = d.lower()
            if guess.lower().count(e) > 0: 
                if e == f.lower() and a != f.lower():
                    k = e.lower()
                if e == g.lower() and b != g.lower():
                    l = e.lower()
                if e == h.lower() and c != h.lower():
                    m = e.lower()
                if e == i.lower() and d != i.lower():
                    n = e.lower()
                if e == j.lower():
                    o = e.capitalize()

            print("Your guess was not correct.")
            print(f"Your hint is: {k} {l} {m} {n} {o} ")

            k = "_"
            l = "_"
            m = "_"
            n = "_"
            o = "_"

            guess = input("What is your guess? ")
            num += 1
            
        else:
            print("Sorry, the guess must have the same number of letters as the sercret word.")
            print("Your hint is _ _ _ _ _")
            guess = input("What is your guess? ")
            num += 1
    num += 1 

    if num != 1:
        print(f"Congratulations! You guessed it! \nIt took you {num} guesses.")
    else:
        print(f"Congratulations! You guessed it! \nIt took you {num} guess.")

    play = input("Would you like to play again? (y/n) ")
    if play.lower().count("y") == 1: #the user can type yes or y
        num = 0
        play = True
        print()
        print("Your hint is _ _ _ _ _")
        guess = input("What is your guess? ")
        
    else:
        play = False
        
print("Come back soon!")
print()