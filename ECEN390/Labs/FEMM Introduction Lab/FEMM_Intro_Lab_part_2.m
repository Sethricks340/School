opts = detectImportOptions('FEMM_intro_lab_2.txt');
opts.DataLines = [3 Inf];  % Start reading from line 3 onward
V_profile = readmatrix('FEMM_intro_lab_2.txt', opts);
MagE_profile = readmatrix('FEMM_intro_lab_2_E.txt', opts);

xV = V_profile(:,1);       % Column 1, Distance (mm)
V = V_profile(:,2);        % Column 2, Voltage (V)

xE = MagE_profile(:,1);    % Column 1, Distance (mm)
E = MagE_profile(:,2);     % Column 2, Electric Field (V/m)

subplot(2, 1, 1);
plot(xV, V, 'r-', 'LineWidth', 1.5);
xlabel('Distance Through the Parallel Plate Capacitor (mm)');
ylabel('Voltage (V)');
title('Voltage Profile with 1 V Difference Between the Top and Bottom Plates – Seth Ricks');
ylim([0, 1.2]);
grid on;

subplot(2, 1, 2);
plot(xE, E, 'b-', 'LineWidth', 1.5);
xlabel('Distance Through the Parallel Plate Capacitor (mm)');
ylabel('Electric Field Magnitude (V/m)');
title('Electric Field Magnitude Profile with 1 V Difference Between the Top and Bottom Plates');
ylim([0, 6000]);
grid on;


