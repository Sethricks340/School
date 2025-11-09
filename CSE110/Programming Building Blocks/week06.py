'''
Week 6: Decisions (and Booleans and complex conditions)
Sis Hansen
'''

credits = 110
gpa = 2.0

# Boolean variables can be assigned directly
can_graduate = True  # should be True or False to be a boolean

# write an expression to determine what the value of can_graduate
# should be if you can graduate if you have 120+ credits and a gpa above 2.0
can_graduate = credits >= 120 and gpa >= 2.0  # replace None with a condition (or complex condition)
print(can_graduate) #will print True or False

# Note: a good boolean variable name will indicate that it only has two possible values (T/F)

# Logical operators (and, or, not) - see Table

# be careful with complex conditions (ones with and/or)
x = 4
y = x == 5 or 2 #returns the first true thing 
print(f'{y=}')
y = x == 5 or x == 2
print(f'{y=}')


# logical operators have an order of operations too 
# not, and, or - see table

meal = "sandwich"
money = 0

if (meal == "sandwich" or meal == "pizza slice") and money > 5:
	print("Your order will be ready in 5 minutes.")
else:
    print("Sorry, can't complete your order.")