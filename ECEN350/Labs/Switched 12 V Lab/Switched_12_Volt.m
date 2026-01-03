SW12V = [12.02, 12.02, 11.95, 11.72, 11.43, 11.29, 10.09, 8.71, 5.307, 3.448];
IL = [0, 12.02e-3, 23.9e-3, 58.6e-3, 114.3e-3, 146.6e-3, 152.88e-3, 158.36e-3, 158.78e-3, 158.78e-3];

plot(IL * 1000, SW12V, 'r-x') 
grid on
xlabel('Load Current (mA)');
ylabel('SW12V (V)');
title('Switched Output Voltage versus Load Current – Seth Ricks');