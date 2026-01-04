opts = detectImportOptions('FEMM_intro_lab.txt');
opts.DataLines = [3 Inf];  % Start reading from line 3 onward
V_profile = readmatrix('FEMM_intro_lab.txt', opts);
MagE_profile = readmatrix('FEMM_intro_lab_E.txt', opts);

xV = V_profile(:,1);       % Column 1, Distance (mm)
V = V_profile(:,2);        % Column 2, Voltage (V)

xE = MagE_profile(:,1);    % Column 1, Distance (mm)
E = MagE_profile(:,2);     % Column 2, Electric Field (V/m)

subplot(2, 1, 1);
plot(xV, V, 'r-', 'LineWidth', 1.5);
xlabel('Distance from the Center of the Coaxial Cable (mm)');
ylabel('Voltage (V)');
title('Voltage Profile with 1 V Difference Between the Inner Conductor and Shield – Seth Ricks');
ylim([0, 1.2]);
grid on;

subplot(2, 1, 2);
plot(xE, E, 'b-', 'LineWidth', 1.5);
xlabel('Distance from the Center of the Coaxial Cable (mm)');
ylabel('Electric Field Magnitude (V/m)');
title('Electric Field Magnitude Profile with 1 V Difference Between the Inner Conductor and Shield');
ylim([0, 500]);
grid on;


