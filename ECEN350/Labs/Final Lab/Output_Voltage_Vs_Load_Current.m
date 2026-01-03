% Measured data
Iload_mA = [0, 44.8, 87.2, 127.4, 135.68, 157.27, 160];   % mA
Vout_V   = [6.91, 6.72, 6.54, 6.37, 6.35, 3.46, 1.76];   % Volts

figure
plot(Iload_mA, Vout_V, 'r-', 'LineWidth', 1.5)
grid on
hold on

% Vertical current limit line
xline(138.141, 'r--', 'LineWidth', 1.2)

% Horizontal reference voltage line
yline(7, 'k--', 'LineWidth', 1.2)

% Manual text labels (bigger, repositioned, with subscripts)
text(142, 2, 'I_{limit}', ...
     'FontSize', 20, 'Color', 'black', ...
     'HorizontalAlignment', 'center')

text(5, 7.2, 'V_{ref} = 7 V', ...
     'FontSize', 20, 'Color', 'k', ...
     'HorizontalAlignment', 'left')

xlim([0 170])
ylim([0 8])

xlabel('Load Current (mA)')
ylabel('Output Voltage (V)')
title('Output Voltage Regulation vs Load Current: Seth Ricks')

hold off
