
% rpm_dat = readmatrix('synchronous_generator_atmpt2.csv', 'Range','A4:I13');

% rpm = rpm_dat(:,1);
% E1 = rpm_dat(:,3);

% plot(rpm, E1, 'r*-', 'LineWidth', 1.5);
% xlabel('Rotational Speed (rpm)');
% ylabel('E_{a} (Vrms)');
% title('LabVolt Synchronous Generator Armature Voltage versus Rotational Speed – Seth Ricks');
% grid on;

rpm_dat = readmatrix('generator_performance.csv', 'Range','A4:I13');

field_curr = rpm_dat(:,2);
E1 = rpm_dat(:,3);

plot(field_curr, E1, 'r*-', 'LineWidth', 1.5);
xlabel('DC Field Current (A)');
ylabel('E_{a} (Vrms)');
title('LabVolt Synchronous Generator Armature Voltage versus Field Current – Seth Ricks');
grid on;