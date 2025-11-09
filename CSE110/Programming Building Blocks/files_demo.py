#courses_file = open("courses.text")

with open("courses.text") as courses_file:
    for line in courses_file:
        #line = "CSE 110,99.5"
        line = line.strip()
        #is there a way to strip this from multiple things??
        parts = line.split(",")
        print(line)

        #parts = ["CSE 110" , "99.5\n"]

        name = parts[0]
        grade = float(parts[1])

        bonus_grade = grade + 3

        print(f"{name} - Grade: {grade}, after bonus: {bonus_grade}")
    
    print("Goodbye")
print("The file is closed now.")

