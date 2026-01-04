theta1 = linspace(0, pi, 100);
phi1 = linspace(0, 2*pi, 100);
[theta, phi] = meshgrid(theta1, phi1); 
F = (cos((pi/2).*cos(theta))./sin(theta)).^2;
F(:, 1) = 0;
F(:, 100) = 0;
[x,y,z]=sph2cart(phi,pi/2-theta,F);
surf(x,y,z), grid on,  axis equal;
colormap(winter);

xlabel("x axis");
ylabel("y axis");
zlabel("Dipole axis");
title("3-D Radiation Pattern of a Half-Wave Dipole: Seth Ricks");