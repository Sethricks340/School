ratio = logspace(-2, 6, 2000);   

db_power_ratio = 10 * log10(ratio);
db_voltage_ratio = 2 * db_power_ratio;

semilogx(ratio, db_power_ratio, 'b-') 
hold on 
semilogx(ratio, db_voltage_ratio, 'r-') 
grid on
xlabel('Ratio');
ylabel('db Magnitude');
title('dB Power and dB Voltage Ratios – Seth Ricks');
legend('dB Power Ratio', 'db Voltage Ratio')
