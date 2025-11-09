"""
Practicing lists and stuff
-Seth Ricks
"""

print()
numbers = []
new_number = 1
sum = 0 

print("Enter a list of numbers, type 0 when finished.")

while new_number != 0:
    new_number = float(input("Enter number: "))

    if new_number != 0:
        numbers.append(new_number)

for i in numbers:
    sum += i 

print(f"The sum is: {sum:.2f}")

length = len(numbers)
average = sum / length 

print(f"The average is: {average:.2f}")

largest = min(numbers) - 1
for number in numbers: 
    if number > largest:
        largest = number

#largest = max(numbers)
print(f"The largest number is: {largest:.2f}")

smallest = max(numbers) + 1
for number in numbers:
    if number > 0 and number < smallest:
        smallest = number
    
if smallest == max(numbers) + 1:
    smallest = "na"

print(f"The smallest positive number is: {smallest:.2f}")

print("The sorted list is:")
sorted = sorted(numbers)
for number in sorted:
    print(number)

print()