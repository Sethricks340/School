f = logspace(0, 10, 2000);   
permeability_r = 1;     
permeability_0 = 4 * pi * 1e-7;  
conductivity = 5.8e7; % S/m
SkinDepth = 1 ./ sqrt(pi * f * permeability_0 * permeability_r * conductivity);
SkinDepth_mm = SkinDepth * 1e3; 
loglog(f, SkinDepth_mm, 'r-') 
grid on
xlabel('Frequency (Hz)');
ylabel('Skin Depth (mm)');
title('Skin Depth versus Frequency for A Copper Conductor – Seth Ricks');