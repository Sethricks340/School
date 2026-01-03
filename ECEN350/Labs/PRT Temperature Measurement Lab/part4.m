vout1 = 3.442593000000000;
TC1 = 25.710678649722038;
Tf1 = 78.279221569499670;
m = 14;

Av = 7.91;
Vref = 2.5;
Vminus = 2.5;
R1 = 1000;
Vs = 5;
vres = 5 / (2^m);
vout = vout1 + vres;

a = 3.9083e-3;
b = -5.7750e-7;
t = 0:0.5:24; % Hourly time vector.
m = 12;

Vplus = (vout - Vref) / Av + Vminus;

Rprt = (Vplus * R1) / (Vs - Vplus);
% Rprt = 1140;

Tc = (-R1 * a + sqrt(R1^2 * a^2 - 4 * R1 * b * (R1 - Rprt))) / (2 * R1 * b);

Tf = Tc * 9/5 + 32;

TC_resolution = Tc - TC1;
TF_resolution = Tf - Tf1;

