"""
Practicing functions with 
the area of shapes
-Seth Ricks
"""

from cmath import pi

def compute_area_square(side):
    return (side ** 2)

def compute_area_rectangle(side1, side2):
    return (side1 * side2)

def compute_area_circle(radius):
    return (pi * (radius ** 2))

print()
shape = ""
while shape.lower() != "quit":
    shape = input("What type of shape do you have? ")

    if shape.lower() == "square":
        side = int(input("What is the length of one side? "))
        print(f"The area of the square is {compute_area_square(side)}")

    elif shape.lower() == "rectangle":
        side1 = int(input("What is the length of the first side? "))
        side2 = int(input("What is the length of the second side? "))
        print(f"The area of the rectangle is {compute_area_rectangle(side1, side2)}")

    elif shape.lower() == "circle":
        radius = int(input("What is the radius of the circle? "))
        print(f"The area of the circle is {compute_area_circle(radius)}")





#stretch challenge
"""
def compute_area_rectangle(side1, side2):
    return (side1 * side2)

def compute_area_square(side):
    return compute_area_rectangle(side, side)

def compute_area_circle(radius):
    return (pi * (radius ** 2))

def compute_area(shape, length1, length2 = 1):
    if shape.lower() == "square":
        length1 = int(input("What is the length of one side? "))
        print(f"The area of the square is {compute_area_square(length1)}")
    elif shape.lower() == "circle":
        length1 = int(input("What is the radius of the circle? "))
        print(f"The area of the circle is {compute_area_circle(length1)}")
    elif shape.lower() == "rectangle":
        length1 = int(input("What is the first side of the rectangle? "))
        length2 = int(input("What is the length of the second side? "))
        print(f"The area of the rectangle is {compute_area_rectangle(length1, length2)}")

print()
shape = ""
length = 0
while shape.lower() != "quit":
    shape = input("What type of shape do you have? ")

    compute_area(shape, length)
    
print()

"""