I2 = [0.008 0.088 0.164 0.342 0.563];

efficiency = [3.368 68.31 78.56 87.07 89.4];

plot(I2, efficiency, 'r-*') 
ylim([0 100])
grid on
xlabel('Load Current (A)');
ylabel('Efficiency %');
title('Transformer Efficiency versus Load Current – Seth Ricks');