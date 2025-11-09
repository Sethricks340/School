"""
Human Resources
-Seth Ricks
"""


#regular 
"""
print()
with open("hr_system.txt") as hr_file:
    for line in hr_file:
        
        line = line.strip()
        parts = line.split(" ")
        name = parts[0]
        title = parts[2]

        print(f"Name: {name}, Title: {title}")
print()
"""



#With stretch challenges
print()
with open("hr_system.txt") as hr_file:
    #skip the header line

    #header = next()
    header = hr_file.readline()
    for line in hr_file:
        
        line = line.strip()
        parts = line.split(" ")
        pay = (float(parts[3]) / 24 )

        if parts[2].lower() == "engineer":
            pay += 1000

        print(f"{parts[0]} (ID: {parts[1]}), {parts[2]} - ${pay:.2f}")

print()
