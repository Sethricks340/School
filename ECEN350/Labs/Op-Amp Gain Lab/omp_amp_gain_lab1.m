% gain = [19.76 19.90 19.90 19.76 19.76 19.47 18.51 13.41];
% freq = [10 100 1e3 10e3 30e3 100e3 300e3 1e6];
% semilogx(freq, gain, 'r-x', 'LineWidth', 1.5)
% grid on
% xlabel('Frequency (Hz)')
% ylabel('Gain (dB)')
% title('Gain Magnitude versus Frequency of A Non-Inverting Op-Amp Configuration – Seth Ricks')

gain = [19.32 19.47 19.47 19.47 19.47 19.14 18.01 12.81];
freq = [10 100 1e3 10e3 30e3 100e3 300e3 1e6];
semilogx(freq, gain, 'r-x', 'LineWidth', 1.5)
grid on
xlabel('Frequency (Hz)')
ylabel('Gain (dB)')
title('Gain Magnitude versus Frequency of An Inverting Op-Amp Configuration – Seth Ricks')