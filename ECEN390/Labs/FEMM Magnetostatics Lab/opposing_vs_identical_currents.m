opts = detectImportOptions('Magnitude_of_field_intensity.txt');
opts.DataLines = [3 Inf];  % Start reading from line 3 onward
MagH_opposing = readmatrix('Magnitude_of_field_intensity.txt', opts);
MagH_identical = readmatrix('Magnitude_of_field_intensity2.txt', opts);    

length_opp = MagH_opposing(:,1);  
H_opp = MagH_opposing(:,2);   
length_same = MagH_identical(:,1);  
H_same = MagH_identical(:,2);   

plot(length_opp, H_opp, 'r-', 'LineWidth', 1.5);
hold on;
plot(length_same, H_same, 'b-', 'LineWidth', 1.5);
hold off;
xlabel('Distance from the Midpoint of Current Carrying Conductors (mm)');
ylabel('∣H∣ (A/m)');
title('∣H∣ Profile of Two Adjacent Conductors - Seth Ricks');
grid on;
legend('Oppositely Directed Currents', 'Identical Currents');

