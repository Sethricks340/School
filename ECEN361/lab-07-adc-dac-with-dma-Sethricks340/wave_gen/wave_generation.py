# Helper file to create triangle and falling_sawtooth wave points

POINTS = 1000
MAX_DAC = 4095 # 12 bits, 0-4095

# triangle points gen
triangle = []
for i in range(POINTS):
    # first half of the period (triangle points increasing)
    if i < POINTS // 2: 
        # ex: 0/4095 is 0%, 4095/4095 is 100%
        fraction_complete = i / POINTS 

        # Twice as much done with this half as the full period
        fraction_complete = 2 * fraction_complete 
        val = int((fraction_complete) * MAX_DAC)
    else:
        # Inverse on downward slope
        fraction_complete = 1- (i / POINTS)

        # Twice as much done with this half as the full period
        fraction_complete = 2 * fraction_complete 

        val = int((fraction_complete) * MAX_DAC)
    triangle.append(val)

# falling_sawtooth points gen
falling_sawtooth = []
# starts over at zero once max val is reaches
for i in range(POINTS):
    val = int((i / POINTS) * MAX_DAC)
    falling_sawtooth.append(val)

# rising_sawtooth points gen
rising_sawtooth = []
# starts over at zero once max val is reaches
for i in range(POINTS):
    val = int((1 - (i / POINTS)) * MAX_DAC)
    rising_sawtooth.append(val)

# Print in C array format
print("const uint16_t triangleWave_1000_pts[1000] = {")
for i, v in enumerate(triangle):
    # separate with "," if it is not the last value
    sep = "," if i < POINTS-1 else ""
    print(f"{v}{sep}", end=" ")
    if (i+1) % 10 == 0:  
        print() # Only 10 per line
print("};\n")

print("const uint16_t falling_sawtoothWave_1000_pts[1000] = {")
for i, v in enumerate(falling_sawtooth):
    sep = "," if i < POINTS-1 else ""
    print(f"{v}{sep}", end=" ")
    if (i+1) % 10 == 0:  
        print() # Only 10 per line
print("};\n")

print("const uint16_t rising_sawtoothWave_1000_pts[1000] = {")
for i, v in enumerate(rising_sawtooth):
    sep = "," if i < POINTS-1 else ""
    print(f"{v}{sep}", end=" ")
    if (i+1) % 10 == 0:  
        print() # Only 10 per line
print("};\n")