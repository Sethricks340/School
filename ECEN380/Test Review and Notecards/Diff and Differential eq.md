Summary of how to solve for the homogenous, particular, natural, and forced responses.

**Homogenous (discrete):**

for discrete, start at the lowest index, that is your constant with no rs. then go up.

ex; y\[n]-1/9y\[n-2]=x\[n-1] -> r^2 +0r -1/9 = 0 -> r = +-1/3

y(h)\[n] = c\_1(-1/3)^n + c\_2(1/3)^n

**Homogenous (continuous):**

for continuous, start with highest order derivative, that is highest r, work way down.

ex; y"(t)+3y'(t)-28y(t)=x(t) -> r^2 + 3r - 28 = 0 -> r = -7, 4

y(h)(t) = c\_1e^(-7t) + c\_2e^(4t)

**Particular (discrete/ continuous):**

Use table for equation to plug in for y, plug input into x, solve for k

**Total (continuous):**

Add Homogenous and Particular solutions, plug in initial conditions, solve for constants

**Total (discrete):**

Add Homogenous and Particular solutions,

find recursive equation (only y\[n] on the left) and solve for y\[0] and y\[1] on the left.

use the new initial conditions of y\[0] and y\[1] to solve for the constants

**Natural response:**

This is where the input is zero, initial conditions are the same.

Find homogenous equation, solve for the constants using the initial conditions (don't need to shift)

**Forced response:**

This is where the input is not zero, but the initial conditions are set to zero.

Find particular equation. Sum together the particular equation and the homogenous equation.

Using the initial conditions set to zero solve for y\[0] and y\[1] using the recursive equation

Use these new initial conditions to solve for the constants of the forced response

The sum of the forced response and the natural response should be the same as the total solution above!

**Questions:**

Something about exceptions with the particular solution form, if the homogenous already has something?

 

