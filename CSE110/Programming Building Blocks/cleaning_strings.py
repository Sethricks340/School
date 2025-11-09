"""
spliting strings

colors = "red green blue yellow"

color_parts = colors.split() 
#defaults to separating the list from the spaces 
#could put anothing in quotes, such as ("e")
#or a comman!! 
#color_parts = ['red', 'green', 'blue', 'yellow']


print(colors)
print(color_parts)

for color in color_parts:
    print(color)

second = color_parts[1]
print(second)
"""





'''
#getting rid of spaces and other things in strings
#very useful for using files 
name = "\tSeth Ricks          \n  "

#clean_name = name.strip()
name = name.strip()

print(f"--------{name}--------")
#print(f"--------{clean_name}--------")
'''