# 1) loop to print 1 through 5 (using a range)


# 2) loop to print "Hello World" a user specified number of times
print()
print()
num_print = int(input("Number of times to print 'Hello World'? "))
for i in range(1, num_print + 1):
    print(i, "Hellow World")


# 3) loop to print each letter in a string (three ways)
print()
my_string = "Hello World"

# 4) loop to print each item in a list
print()
my_list = [1,3,5,7,9]


# team activity - looping through strings 

# stretch
first_name = "Brigham"
last_name = "Younger"

# use range and len to loop through the string
for i in range(len(first_name)):
    print(f"The letter {first_name[i]} is at position {i} in the first name")
    print(f"The letter {last_name[i]} is at position {i} in the last name")
    # we could also use if statements to check if the letters are the same

