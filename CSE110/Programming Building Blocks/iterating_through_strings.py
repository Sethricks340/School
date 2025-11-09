# """
# Team activity practicing for loops and strings
# -Seth Ricks
# """
# print("This is line one." , end= "")
# print("This is line two.")

# print()
# word = "commitment"
# favletter = input("What is your favorite letter? ")
# for letter in word:
#     if letter.lower() == favletter.lower():
#         print("_" , end= "")
#     else:
#         print(letter.lower(), end = "")

quote = "In coming days, it will not be possible to survive spiritually without the guiding, directing, comforting, and constant influence of the Holy Ghost."
length = len(quote)

again = "yes"

while again == "yes":
    number = int(input("Please enter a number: "))

    for i in range(length):
    #for i, letter in enumerate(quote)   <---- Or could do this 
    
        letter = quote[i]

        if i % number == 0:
            print(letter.upper() , end = "")
        else:
            print(letter.lower() , end = "")
    print()
    again = input("Again? ")

print("Goodbye")