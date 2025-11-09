''' 
Week 2: More variables, input, and output
Sister Hansen
What kind of comment is this?
'''

#### variables (and good names) - What kind of comment is this?
# create a string variable
name= "bill"
print(name)
name = input("What's your name? ")
print("user's name is:", name)

# create an integer variable
number = 10 
print(number)

# create a float variable
float_number = 10.123456789  #have to put a decimal to make it a float number
print(float_number)

#### input
# get input from the user and store it in a variable


# get a number from the user (decide if you want to convert now or later)
age = int(input("Enter your age: "))
print(age) 
print("Your age in 10 years will be", int(age) + 10) #can put int here too but just do it line 27

#### output and f-strings
# output all the variables with a single print statement
print("all of the variables:", age, name     , number,float_number) #spaces dont do anything unless in quotes

# now use an f-string to output all the variables
print(f"All of the variables: name:{name}, \nage:{age}, \nnumber: {number}, float {float_number:.5f} ")

# output all the variables again, but use a string method on one 
# so that it prints in upper case, lower case, or title case

print(f"All of the variables: name:{name.upper()}, \nage:{age}, \nnumber: {number}, float {float_number:.5f} ")
print("all the pretty horses".title())
print("all the pretty horses".capitalize())
print("all the pretty horses".lower())
print("all the pretty horses".count("t"))
print("all the pretty horses".lower().count("t"))
print("all the pretty horses".upper().count("t"))


