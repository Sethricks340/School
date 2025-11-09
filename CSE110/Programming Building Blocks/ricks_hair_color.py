'''
This was me playing with my first if else statements. 
'''

print()
name = input("What is your name? ")

if name.lower() in("seth" , "trevor" , "alex" , "dani" , "ben" , "rose" , "mom" , "dad"):
    if name.lower() in("trevor" , "dani" , "ben" , "mom"):
        hair = "red"
    elif name.lower() == "dad":
        hair = "black"
    elif name.lower() == "alex":
        hair = "brown"
    elif name.lower() == "rose":
        hair = "blond"
    if name.lower() == "seth":
        print("Hey you're me!")
    else: 
        print(f"You're hair is {hair}!")
else:
    print("You are not a part of the Ricks family. :( Are you a girl and would like to be? My number is 701-818-4325")
print()