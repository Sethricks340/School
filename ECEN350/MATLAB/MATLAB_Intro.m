% Matlab Script to plot a sine Wave.
% Create the x and y vectors to plot.
x = 0:6:360; % The values of x in degrees.
y = sind(x); % Calculate sin(x) with x in degrees, i.e., sind().
plot(x,y), grid; % Plot the graph including a grid.
% Annotate the graph
title('Sine Wave - Seth Ricks'); % Add a Title, including your name.
xlabel('Degrees'); % Label plot x axis.
ylabel('Amplitude'); % Label plot y axis.
axis([0 360 -1.1 1.1]); % Set plot axis limits.