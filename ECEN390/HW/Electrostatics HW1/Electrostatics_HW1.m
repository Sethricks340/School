
% Find electric field E at R, 
% with q1 located at R1 and q2 located at R2

R = [0, 3, 1];            % x, y, z 
R1 = [5, 2, -1];          % x, y, z 
R2 = [-3, -1, 4];         % x, y, z 
epsilon = 8.85e-12;       % F/m 
k = 1/(4 * pi * epsilon); % Nm^2 / C^2
q1 = 4e-6;                % C
q2 = -2e-6;               % C

% Electric field E at R due to q1 and q2
E = k * (q1*(R-R1)/norm(R-R1)^3 + q2*(R-R2)/norm(R-R2)^3);

