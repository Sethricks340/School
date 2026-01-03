Tab = readtable('Figure3.txt'); % Read in LTspice table data.
Tab1 = Tab.Variables;  % Extract numeric data, eliminating column headings.
vt = Tab1(:, 2); % Form a column vector of V(vout) data.
vout = vt'; % Transpose V(vout) data to obtain a row vector.

Av = 7.91;
Vref = 2.5;
Vminus = 2.5;
R1 = 1000;
Vs = 5;

a = 3.9083e-3;
b = -5.7750e-7;
t = 0:0.5:24; % Hourly time vector.

Vplus = (vout - Vref) ./ Av + Vminus;

Rprt = (Vplus * R1) ./ (Vs - Vplus);
% Rprt = 1140;

Tc = (-R1 * a + sqrt(R1^2 * a^2 - 4 * R1 * b * (R1 - Rprt))) / (2 * R1 * b);

Tf = Tc .* 9/5 + 32;

yyaxis left
plot(t, Tf, 'b-'), grid on; % Temperature in Fahrenheit. 
xlim([0, 24]);
xticks([0, 6, 12, 18, 24]);
xlabel('Hours past Midnight');
ylabel('Temperature \circ F');
yyaxis right
plot(t, Tc), grid on;  % Temperature in Celsius.
ylabel('Temperature \circ C');
legend('\circ Fahrenheit', '\circ Celsius');
title("Diurnal Temperature Variation – Seth Ricks");


