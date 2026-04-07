% x(t) = 10e^(-t) - 5e^(-0.5t)
% plot x(t) versus t for t = 0:0.01:5
t = 0:0.01:5;
x = 10 * exp(-t) - 5 * exp(-0.5 * t);
plot(t,x);
grid on;
title('Seth Ricks');
xlabel('t'); 
ylabel('X(t)');

