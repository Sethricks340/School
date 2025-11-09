'''This calculates eligibility for a loan,
practicing if elif else statements with and and or
-Seth Ricks
Call me <3 701-818-4325'''

print()
print("Please answer the following questions on a scale of 1-10: ")
print()
loan_size = float(input("How large is the loan? "))
credit_history = float(input("How good is your credit history? "))
income = float(input("How high is your income? "))
down_payment = float(input("How large is your down payment? "))

loan = False

if loan_size >= 5:
    if credit_history >= 7 and income >= 7:
        loan = True
    elif credit_history >= 7 or income >=5:
        if down_payment >= 5:
            loan = True
        else:
            loan = False
    else: 
        loan = False
elif loan_size < 5:
    if credit_history < 4:
        loan = False
    elif income >= 7 or down_payment >= 7:
        loan = True
    elif income >=4 and down_payment >=4:
        loan = True
    else:
        loan = False
else:
    loan = False

print()
if loan:
    print("You qualify for the loan.")
else:
    print("You do not qualify for the loan.")
print()