
t = 0:100e-6:20e-3; % 0 to 20 ms, in steps of 100 microseconds

Vm_emf = 150.80 * sin(377.0*t);

plot(t*1000, Vm_emf, 'r-') % *1000 scales the axis from s to ms
grid on
xlabel('Time (ms)');
ylabel('Voltage (V)');
title('AC Generator Output Voltage – Seth Ricks');

    