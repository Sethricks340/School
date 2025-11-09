"""
Practice finding things
in a list I guess 
-Seth Ricks
"""

people = [
    "Stephanie 36",
    "John 29",
    "Emily 24",
    "Gretchen 54",
    "Noah 12",
    "Penelope 32",
    "Michael 2",
    "Jacob 10"
]
youngest_age = 1000
youngest_person = ""

print()
for i in people:
    parts = i.split(" ")
    print(f"Name: {parts[0]:10}    Age: {parts[1]}")
    age = int(parts[1])
    person = parts[0]
    if age < youngest_age:
        youngest_age = age
        youngest_person = person

print(f"{youngest_person} is the youngest person, who is {youngest_age}.")
print()