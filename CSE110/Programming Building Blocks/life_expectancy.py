"""
Life expectancy 
-Seth Ricks
"""

lowest_life = 100000
highest_life = -1
higest_life_country = ""
lowest_life_country = ""
highest_life_year = ""
lowest_life_year = ""

selected_highest_life = -1
selected_lowest_life = 100000
selected_high_country = ""
selected_low_country = ""

country_choice = ""
country_choice_low = 100000
country_choice_high = -1
choice_low_year = ""
choice_high_year = ""

sum = 0
sum2 = 0
count = 0
count2 = 0

print()

with open("life-expectancy.csv") as life_file:
    header = life_file.readline()

    selected_year = input("Enter the year of interest: ")
    country_choice = input("Enter the country of interest: ")
    print()

    for line in life_file:

        line = line.strip()
        parts = line.split(",")
        
        country = parts[0]
        ID_code = parts[1]
        year = parts[2]
        life_expectancy = float(parts[3])
        
        if life_expectancy < lowest_life:
            lowest_life = life_expectancy
            lowest_life_country = country
            lowest_life_year = year
        
        if life_expectancy > highest_life:
            highest_life = life_expectancy
            higest_life_country = country
            highest_life_year = year

        if year == selected_year:
            sum += life_expectancy
            count += 1
        
            if life_expectancy < selected_lowest_life:
                selected_lowest_life = life_expectancy
                selected_low_country = country  

            if life_expectancy > selected_highest_life:
                selected_highest_life = life_expectancy
                selected_high_country = country
        
        if country_choice.lower() == country.lower():
            sum2 += life_expectancy
            count2 += 1 

            if life_expectancy < country_choice_low:
                country_choice_low = life_expectancy
                choice_low_year = year

            if life_expectancy > country_choice_high:
                country_choice_high = life_expectancy
                choice_high_year = year

if count != 0 and count2 != 0:
                    
    print(f"For the year {selected_year}:")
    print(f"The average life expectancy across all countries was {(sum / count):.2f}")
    print(f"The max life expectancy was in {selected_high_country} with {selected_highest_life:.2f} ")
    print(f"The min life expectancy was in {selected_low_country} with {selected_lowest_life:.2f}")
    print()

    print(f"For the country {country_choice.title()}:")
    print(f"The average life expectancy across all years is {(sum2 / count2):.2f}")
    print(f"The max life expectancy was {country_choice_high:.2f} in {choice_high_year}")
    print(f"The min life expectancy was {country_choice_low:.2f} in {choice_low_year}")
    print()

    print(f"The overall maximum life expectancy is: {highest_life:.2f} from {higest_life_country} in {highest_life_year}")
    print(f"The overall minimum life expectancy is: {lowest_life:.2f} from {lowest_life_country} in {lowest_life_year}")
    print()
    print()

else:
    print("Sorry, one of the inputs is not valid. Please try again.")
    print()