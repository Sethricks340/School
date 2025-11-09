"""
This calculates windchill
in Fahrenheit and Celsius
given a temperature
-Seth Ricks 
"""

print()

temp = float(input("What is the temperature? "))
degree_type = input("Fahrenheit or Celsius (F/C)? ")

def compute_windchill(temp, windspeed):
    windchill = (35.74 + 0.6215 * (temp) - 35.75 * (windspeed ** 0.16) + 0.4275 * (temp) * (windspeed ** 0.16))
    return(windchill)

def temp_conversion(temp, degree_type):
    if degree_type.lower() == "f":
        converted_temp = ((temp - 32) * (5/9))
    if degree_type.lower() == "c":
        converted_temp = (temp * (9/5)) + 32
    return(converted_temp)
    
if degree_type.lower() == "f":
    opposite_degree_type = "C"
if degree_type.lower() == "c":
    opposite_degree_type = "F"

for windspeed in range(5, 65, 5):
    #This displays the windshield in the degree type that the user prefers
    print(f"At temperature {temp:.1f}{degree_type.upper()}, and wind speed {windspeed} mph, the windchill is: {compute_windchill(temp, windspeed):.2f}{degree_type.upper()}")

    #This displays the windshield in the opposite degree type
    print(f"At temperature {temp_conversion(temp, degree_type):.1f}{opposite_degree_type}, and wind speed {windspeed} mph, the windchill is: {compute_windchill(temp_conversion(temp, degree_type), windspeed):.2f}{opposite_degree_type}")
    
    print()