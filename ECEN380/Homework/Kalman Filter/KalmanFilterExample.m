%MATLAB Solution Code
close all %Close all figures
clear % Clear all variables and functions
clc %Clear the Command Window

dt = 0.1; %(s) timestep
t = 0:dt:5; %(s) discrete time vector
N = length(t); %Number of simulation timesteps

u = 4*sin(3*t); %(V) true (but unknown) input
um = u + 0.5*randn(size(u)); % **** noisy (but known) input

%True (but unknown) state-space system
A = [0,1;-2,-3];
B = [0;1];
C = [1,0];
D = 0;

Fd = expm([A*dt,B*dt;zeros(1,3)]);
Ad = Fd(1:2,1:2);
Bd = Fd(1:2,3);

% **** Inaccurate model of the true state-space system
Am = [0.1, 1; -1.6, -3.2];
Bm = [-0.1;1.2];
Cm = [1,0];
Dm = 0;
 
Fdm = expm([Am*dt,Bm*dt;zeros(1,3)]);
Adm = Fdm(1:2,1:2);
Bdm = Fdm(1:2,3);
% 
%True (but unknown) initial conditions
x = [3;-2];

%Initial state-prediction
xHat = [0;0];

%Initial state-covariance prediction
PHat = eye(size(Am));

%Kalman filter tuning matrices
Q = diag([0.01,0.01]); % **** Process noise covariance
R = 0.01; % *** Sensor noise covariance 

%Allocate memory to store the state-variables
xVec = zeros(2,N); %True (but unknown) state variables
yVec = zeros(1,N); %True (but unknown) state variables
xHatVec = zeros(2,N); %Kalman-filter estimated state variables

%Simulate the true system in the same FOR loop as the Kalman filter
for ii = 1:N
    %Simulate the true (but unknown) system
    xVec(:,ii) = x; %Store the true (but unknown) state
    y = C*x +D*u(ii); %True (but unknown) position of the output
    yVec(1,ii) = y;

    ym = y + 0.1*randn; % **** Noisy measurement of the output

    x = Ad*x + Bd*u(ii); %Update the true (but unknown) state at t_(k+1).
    
    %Run the Kalman filter
    xHatVec(:,ii) = xHat; %Store the Kalman filter's state estimate at t_k.
    
    %Model prediction at time t(ii): 
    % with inaccurate matricies Adm, Bdm, Cm, Dm and noicy input um(ii)
    xp = Adm*xHat + Bdm*um(ii); %Step 1: Model prediction of the state
    Pp = Ad*PHat*Ad' + Q; %Step 2: Model prediction of the state-covariance
    yp = Cm*xHat + Dm*um(ii); %Step 3: Model's prediction of the output
    
    %Sensor correction
    S = Cm*Pp*Cm' + R; %Sept 4:

    sK = Pp*C'*S^(-1); %Step 5: Kalman gain
    xHat = xp + sK*(ym - yp); %Step 6: Kalman filter's estimate of the state.

    % The Kalman filter calculates an estimate 𝑥Hat of the state by comparing
    % the model's prediction 𝑦𝑝 with the sensor's measurement 𝑦m of the output.
    % The larger the difference, the more the correction is applied to the state
    % estimate 𝑥Hat.
    % The Kalman gain sK, which is a function of the model and sensor covariance, 
    % is the correction gain. If the sensor is more certain than the model, the 
    % Kalman gain sK will correct the state towards the sensor's prediction. 
    % If the model is more certain than the sensor, the Kalman gain sk will 
    % correct the state towards the model's prediction 𝑥𝑝.

    PHat = (eye(size(A))-sK*C)*Pp; %Step 7: Kalman's estimate of state-covariance
end

% %Plot the results
% figure; clf
% subplot(211)
% plot(t, xVec(1,:), t, xVec(2,:),'--')
% ylabel('x')
% legend('x_1','x_2')
% title('Simulating State Space System')
% 
% subplot(212)
% plot(t,yVec(1,:),'--')
% ylabel('y')
% xlabel('Time (s)')


%Plot the results
figure; clf
subplot(211)
plot(t, xVec(1,:), t, xHatVec(1,:),'--')
ylabel('x_1')
legend('True','Estimate')
title('Kalman Filter State Estimation Results')

subplot(212)
plot(t,xVec(2,:), t, xHatVec(2,:),'--')
ylabel('x_2')
xlabel('Time (s)')

