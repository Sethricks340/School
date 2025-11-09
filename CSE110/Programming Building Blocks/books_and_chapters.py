"""
Practicing files 
-Seth Ricks
"""

# Book:chapters:volume
# Hebrews:13:New Testament

largest_book = ""
largest_book_number = 0
largest_BOM_book = ""
largest_BOM_number = 0

with open("books_and_chapters.txt") as books_file: 

    for line in books_file:

        #book, chapters, volume = line.strip().split(":")

        line = line.strip()
        parts = line.split(":")

        book = parts[0]
        chapters = int(parts[1])
        volume = parts[2]

        if chapters > largest_book_number:
            largest_book_number = chapters
            largest_book = book

        if volume.lower() == "book of mormon":
            print(f"Scripture: {volume}, Book: {book}, Chapters: {chapters}")

            if chapters > largest_BOM_number:
                largest_BOM_number = chapters
                largest_BOM_book = book

        #print(f"Scripture: {volume}, Book: {book}, Chapters: {chapters}")
    
    print(f"The largest book in the BOM is {largest_BOM_book} with {largest_BOM_number} chapters.")
    print(f"The largest book in all scripture is {largest_book} with {largest_book_number} chapters.")








#strech challenge
"""
largest_book = ""
largest_book_number = 0
count = 0 

print()
with open("books_and_chapters.txt") as books_file: 

    selected_volume = input("Which volume of scripture would you like to learn about? ")

    for line in books_file:

        line = line.strip()
        parts = line.split(":")

        book = parts[0]
        chapters = int(parts[1])
        volume = parts[2]

        if selected_volume.lower() == volume.lower():

            if chapters > largest_book_number:
                largest_book_number = chapters
                largest_book = book
                count += 1

if count != 0:
        
    print()
    print(f"The largest book in the {selected_volume.title()} is {largest_book} with {largest_book_number} chapters.")
    print()
else:
    print("Sorry the input is invalid. Please try again.")
"""