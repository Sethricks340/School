from cmath import pi


length= input("Input a number x cm: ")
width = input("Input a number y cm: ")
area_square= float(length) **2
print(f"The area of a square with x as the length is: {area_square:.5f} cm^2")
area_square_m= area_square / 10000
print(f"Or {area_square_m:5f} m^2")

# length2= input("What is the length of the rectangle? ")
# width = input("What is the width of the rectangle? ")
area_rectangle= float(length) * float(width)
print(f"The area of a rectangle with x as the length and y as the width is {area_rectangle:.5f} cm^2")
area_rectangle_m= area_rectangle /10000
print(f"Or {area_rectangle_m:5f} m^2")

# radius= input("What is the radius of the circle? ")
area_circle= (float(length)**2) * pi 
print(f"The area of a circle with x as the radius is: {area_circle:5f} cm^2")
area_circle_m= area_circle / 10000
print(f"Or {area_circle_m:5f} m^2")

volume_cube= float(length)**3
print(f"The volume of a cube with x as the length is {volume_cube:5f} cm^3")
volume_cube_m= volume_cube / 1000000
print(f"Or {volume_cube_m:5f} m^3")

volume_sphere = (float(length)** 3) * (4/3) * (pi) 
print(f"The volume of a sphere with x as the radius is {volume_sphere:5f} cm^3")
volume_sphere_m = volume_sphere /1000000 
print(f"Or {volume_sphere_m:5f} m^3")
