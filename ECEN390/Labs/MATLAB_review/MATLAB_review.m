% A = [1; 2; 3];
% A1 = sum(A);
% A2 = norm(A);
% A3 = length(A);

% M = [1,2,3; 4,5,6; 7,8,9];
% M_col2 = M(:,2);
% M_row2 = M(2,:);

% theta = [1,2,3,4,5];
% F = cos(theta) ./ (sin(theta) + 2);

% Plotting Complex Number
% t = 0:0.01:2;
% f = 1; % 1Hz
% V = exp(1i*2*pi*f*t); % exp(x) -> e^x
% R = real(V);
% X = imag(V);
% Z = sqrt(R.^2 + X.^2);
% plot( t, Z, 'b', t, R, 'g', t, X, 'r');
% grid on;
% title('Seth Ricks');
% xlabel('Time (seconds)'); 
% ylabel('Amplitude (V)'); 
% axis([0 2 -1.1 1.1]); % Set plot axis limits.
% legend("Magnitude of e^{j2\pit}", "Real part of e^{j2\pit}", "Imaginary part of e^{j2\pit}");


% 3-D Plotting
y = 0:0.1:15.7;
z1 = sin(y);
x1 = 0 .* y; % Vector of all 0s of same length as y
x2 = (1/377) * sin(y);
z2 = 0 .* y; 

plot3(x1, y, z1, 'ro', x2, y, z2, 'b+'), grid on;
hold on
plot3(x1, y, z1, '-r',   x2, y, z2, '-b'), grid on;
hold off
set(gca, 'XDir', 'reverse', 'YDir', 'reverse');
title('Electromagnetic Wave Propagation - Seth Ricks');
xlabel('x-axis (A/m)');
ylabel('y-axis (m)');
zlabel('z-axis (V/m)');
legend("Electric Field Intensity", "Magnetic Field Intensity");


