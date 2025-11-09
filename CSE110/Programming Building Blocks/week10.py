'''
week10.py
Sis Hansen
'''

#### review
nums = []  # empty list we can append to later
nums = [1,5,7,9]  # initialized list
print(f'the third item is: {nums[2]}') # using the index

# get the number of items in the list & print it
num_nums = len(nums)
print(num_nums)

# loop through a list to print each item
for item in nums:
    print(item)

# loop through a list using the index (and range)
print('\nprint with index')
for i in range(len(nums)): 
        print(f"index: {i} value: {nums[i]}")

#### NEW
# loop thru list using index and user friendly (+1) display
print("\nuser friendly (don't print 0)")
for i in range(len(nums)):
    print(f"item: {i+1} value: {nums[i]}")

# use the index for 2 "parallel" lists
names = ['bill', 'jenny', 'tom']
ages = [9, 10, 8]
print('\nloop thru two lists to print both values')
for i in range(len(names)):
    print(f"item: {i + 1} values: {names[i]} - {ages[i]}")
# index + 1 makes it more user friendly


# replace the second age 
print('\nages before changing 2nd item (index 1):', ages)
ages[1] = 99
print('ages after changing the 2nd item:', ages)

# ask the user which item they want to replace
# if I used user friendly numbers to display, 
# I need to -1 to get the correct index 
replace = int(input("Which age do you want to replace: ")) - 1
age_replace = int(input("What age should it be replaced with: "))
ages[replace] = age_replace

# show the list again to show the new age is in the list
print('\naltered list:', ages)



# remove an item from the nums list with pop()
nums = [1,5,7,9]  # initialized list
print('\nbefore popping from nums')
print(nums)
nums.pop()

print('\nafter popping from nums' , nums)

# print the item removed (popped)











# print()

# BONUS: insert a value at index 1 (may confuse some)
# val = (input('Enter a value to insert at index 1: '))
# nums.insert(1, val)
# print('list with value inserted at index 1: ', nums)
# print()

