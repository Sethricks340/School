f = [10, 30, 100, 300, 1e3, 10e3, 30e3, 100e3, 300e3, 1e6, 2e6, 5e6, 10e6];
dB = [5.42, 14.99, 22.23, 24.27, 24.69, 24.80, 24.92, 24.92, 25.32, 25.51, 24.15, 19.20, 14.23];

semilogx(f, dB, 'r-x') 
grid on
xlabel('Frequency (Hz)');
ylabel('Gain Magnitude dB');
title('Gain Magnitude versus Frequency of a BJT Amplifier – Seth Ricks');