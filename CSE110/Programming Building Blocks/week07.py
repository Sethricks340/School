'''
week07.py
Sister Hansen
'''
# create the following:

# while loop to print 'Hello World' 10 times
# we'd usually use a for loop for this (next lesson)

i = 0 
while i < 10:
    print(f' {i=} Hello World 10 times')
    i += 1 


 
# while loop dependant on user input 
# print the number the user enters until they input 0


print("\nLet's print your numbers")
num = -1
while num != 0:
    num = int(input("Enter a number (0 to quit): "))
    if num != 0:
        print(f"{num}")



# while loop to get user input until it matches 'run' or 'hide'

choice = ''

while choice != 'run' and choice != 'hide':
    choice = input('Do you want to RUN or HIDE:').lower()
    if choice == "run":
        print("You chose to run")
    elif choice == "hide":
        print("You chose to hide")