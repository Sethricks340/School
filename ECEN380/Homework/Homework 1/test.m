% Part (a)
amplitude = 5;    % Volts
fund_freq = 20;   % Hz
duty_cycle = 0.6; % Duty cycle
t = 0:0.01:1;     % Time
squarewave = amplitude * square(fund_freq * t, duty_cycle);
plot(t, squarewave);
% hold on;

% Part (b)


% hold off;