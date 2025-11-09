'''
This caluculates how fast an object will fall
Seth Ricks 
'''
import math

print("Welcome to the velocity caclulator. Please enter the following:")
print()

mass = float(input("Mass (in kg): "))
#gravity = float(input("Gravity in m/s^2, 9.81 for Earth, 24 for Jupiter): "))

g_mercury = 3.7
g_venus = g_uranus = 9.87
g_earth = 9.81
g_mars = 3.721
g_jupiter = 24.79
g_saturn = 10.44
g_neptune = 11.15
g_pluto = 0.62

time = float(input("Time (in seconds): "))
density_fluid = float(input("Density of the fluid (in kg/m^3, 1.3 for air, 1000 for water, 3,100 for lava): "))
cross_sectional_area = float(input("Cross sectional area (in m^2), (pi*r^2 for sphere, same for a cylinder, (pi *r^2)/2 for a solid hemisphere): "))
drag_constant = float(input("Drag constant (0.5 for sphere, 1.1 for cylinder, 0.42 for solid hemisphere): "))

c = (1/2) * (density_fluid) * (cross_sectional_area) * (drag_constant)

v_mercury = (math.sqrt((mass * g_mercury) / c )) * (1 - (math.exp(- ((math.sqrt( mass * g_mercury * c )) / mass) * time)))
v_venus = v_uranus = (math.sqrt((mass * g_venus) / c )) * (1 - (math.exp(- ((math.sqrt( mass * g_venus * c )) / mass) * time)))
v_earth = (math.sqrt((mass * g_earth) / c )) * (1 - (math.exp(- ((math.sqrt( mass * g_earth * c )) / mass) * time)))
v_earth = (math.sqrt((mass * g_earth) / c )) * (1 - (math.exp(- ((math.sqrt( mass * g_earth * c )) / mass) * time)))
v_mars = (math.sqrt((mass * g_mars) / c )) * (1 - (math.exp(- ((math.sqrt( mass * g_mars* c )) / mass) * time)))
v_jupiter = (math.sqrt((mass * g_jupiter) / c )) * (1 - (math.exp(- ((math.sqrt( mass * g_jupiter * c )) / mass) * time)))
v_saturn = (math.sqrt((mass * g_saturn) / c )) * (1 - (math.exp(- ((math.sqrt( mass * g_saturn * c )) / mass) * time)))
v_neptune = (math.sqrt((mass * g_neptune) / c )) * (1 - (math.exp(- ((math.sqrt( mass * g_neptune * c )) / mass) * time)))
v_pluto = (math.sqrt((mass * g_pluto) / c )) * (1 - (math.exp(- ((math.sqrt( mass * g_pluto * c )) / mass) * time)))

print()
print(f"The inner value of c is: {c:.3f}")
print()
print(f"The velocity on Mercury after {time:.1f} seconds is: {v_mercury:.3f} m/s")
print(f"The velocity on Venus or Uranus after {time:.1f} seconds is: {v_venus:.3f} m/s")
print(f"The velocity on Earth after {time:.1f} seconds is: {v_earth:.3f} m/s")
print(f"The velocity on Mars after {time:.1f} seconds is: {v_mars:.3f} m/s")
print(f"The velocity on Jupiter after {time:.1f} seconds is: {v_jupiter:.3f} m/s")
print(f"The velocity on Saturn after {time:.1f} seconds is: {v_saturn:.3f} m/s")
print(f"The velocity on Neptune after {time:.1f} seconds is: {v_neptune:.3f} m/s")
print(f"The velocity on Pluto after {time:.1f} seconds is: {v_pluto:.3f} m/s")
print()

v_terminal_earth = math.sqrt((mass * g_earth) / c)
print(f"The terminal velocity on Earth after {time:.1f} seconds is: {v_terminal_earth:.3f} m/s")
print()
print("Thank you for participating. Call me for a fun date: 7  01-818-4325")
print()
