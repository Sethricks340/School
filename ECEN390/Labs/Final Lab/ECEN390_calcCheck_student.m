% Author: Riley Corbin, 6/30/2023.
% Tested On MATLAB R2023a and MATLAB Online
% Description:
%   This file is to be used by the student to check their calculations. The student is to run the
%       script and then enter their values in the Command Window as prompted.
%   You can see information regarding your values in the Command Window. You can see
%       desired and calculated/selected values, if you chose 1% resistor or 10% capacitor values, 
%       are within the given ranges, if you have selected the correct R2 and R1 values for the 
%       output voltage you want, and more. 

calcCheck();

function [] = calcCheck()
    clc
        
    % User Input Section
    % Tells you how to enter the values so that values, such as 33 kΩ, are 
    %   entered as 33e3 (33000) rather than 33.
    fprintf("Created by Tau Beta Pi member Riley Corbin \n")
    disp("-----------------------------------------------------");
    disp("<strong>Enter your values in the following format</strong>")
    disp("-----------------------------------------------------");
    disp("Vout = 5");
    disp("R2 = 1.2e6");
    disp("R1 = 3.5e6");
    disp("L1_calc = 5.2e-6");
    disp("L1 Inductance = 6.2e-6");
    disp("L1 Current Rating= 5");
    disp("Cout_calc = 30e-6")
    disp("Cout = 60e-6")
    disp("I_D_calc = 610e-3");
    disp("D1 Average Current = 3");
    disp("D1 Breakdown Voltage = 24");
    disp("-----------------------------------------------------");
    disp("");

    % Takes user input from the Command Window for each value.
    Vout = input("<strong>Vout =  </strong>");
    R2 = input("<strong>R2 = </strong>");
    R1 = input("<strong>R1 = </strong>");
    L1_calc = input("<strong>L1_calc = </strong>");
    L1 = input("<strong>L1 Inductance = </strong>");
    I_L1 = input("<strong>L1 Current = </strong>");
    Cout_calc = input("<strong>Cout_calc = </strong>");
    Cout = input("<strong>Cout = </strong>");
    I_D_calc = input("<strong>I_D_calc = </strong>"); 
    I_D_ave = input("<strong>D1 Average Current = </strong>");
    Vb = input("<strong>D1 Breakdown Voltage = </strong>");

    clc
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % Constants Section
    V_inMax = 24;      % Maximum input voltage
    Vout_min = 3;       % Minimum output voltage
    Vout_max = 10;    % Maximum output voltage
    V_ref = 1.19;         % Reference voltage used during feedback
    V_d = 0.5;             % Drop across the schottky diode
    f_sw = 800e3;       % Switching frequency
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % R1 and R2 Section 
    ratio_t = round(Vout/V_ref - 1,3);                             % R1/R2 ratio using the exact, calculated method
    ratio = round(R1/R2,3);                                            % R1/R2 ratio using the values the student chose
    ratio_min = round(Vout_min/V_ref - 1,3);                % Minimum ratio that student should get
    ratio_max = round(Vout_max/V_ref - 1,3);               % Maximum ratio that student should get
    R1_t = R2*ratio_t;                                                     % Desired value of R1 using the exact ratio
    sum_t = round(R1_t + R2, 2);                                   % R1+R2 using the desired value of R1
    sum = round(R1+R2, 2);                                          % R1 + R2 using the student's chosen values

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % L1 Section
    L1_t = (Vout+V_d)/f_sw;                         % Desired value of L1 using the exact, calculated method
    L1_calc_min = (Vout_min+V_d)/f_sw;     % Minimum L1_calc that student should get
    L1_calc_max = (Vout_max+V_d)/f_sw;    % Maximum L1_calc that student should get
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % Cout Section
    Cout_t = 100/(Vout*f_sw);                           % Desired value of Cout using the exact, calculated method
    Cout_calc_min = 100/(Vout_max*f_sw);      % Minimum Cout_calc that student should get
    Cout_calc_max = 100/(Vout_min*f_sw);      % Maximum Cout_calc that student should get

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % I_D Section
    I_D_t = (V_inMax-Vout)/V_inMax;                           % Desired value of I_D using the exact, calculated method
    I_D_calc_min = (V_inMax-Vout_max)/V_inMax;      % Minimum I_D_calc that student should get
    I_D_calc_max = (V_inMax-Vout_min)/V_inMax;      % Maximum I_D_calc that student should get
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % Range Check Section
    % Check to see if the given/student values are within range. If the value is a resistor or capacitor,
    %   then it also checks if it is a standard 1% resistor or 10% capacitor value.
    [~ , Vout_rngStr] = checkVal('Vout', Vout, Vout_min, Vout_max);
    [R2_1Str, R2_rngStr] = checkVal('R2', R2, 100e3, 10e6);
    [R1_1Str, R1_rngStr] = checkVal('R1', R1, 1e6, 10e6);
    [~, sum_rngStr] = checkVal('R1+R2', sum, 1.6e6, 10e6);
    [~, ratio_rngStr] = checkVal('R1/R2', ratio, ratio_min, ratio_max);

    [~, L1_calc_rngStr] = checkVal('L1_calc', L1_calc, L1_calc_min, L1_calc_max);
    [~, L1_rngStr] = checkVal('L1', L1, 4.1e-6, 13.2e-6);
    [~, I_L1_rngStr] = checkVal('I_L1', I_L1, 2, 3);

    [~, Cout_calc_rngStr] = checkVal('Cout_calc', Cout_calc, Cout_calc_min, Cout_calc_max);
    [Cout_10Str, Cout_rngStr] = checkVal('Cout', Cout, 15e-6, 47e-6);

    [~, I_D_calc_rngStr] = checkVal('I_D_calc', I_D_calc, I_D_calc_min, I_D_calc_max);
    [~, I_D_ave_rngStr] = checkVal('I_D_ave', I_D_ave, 0.7, 1.5);
    [~, Vb_rngStr] = checkVal('Vb', Vb, 30, 40);
   
    % Check to see what ratio range the chosen R1 and R2 values will yield.
    if (ratio == ratio_t)
        ratio_resultStr = "R1 and R2 will get you the desired ratio.";
    elseif (ratio>=0.99*ratio_t && ratio<=1.01*ratio_t)
        ratio_resultStr = "R1 and R2 will get you within ±1% of your desired ratio.";
    else
        ratio_resultStr = "<strong>*****R1 and R2 will not get you within ±1% of your desired ratio.*****</strong>";
    end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % Creating Vectors for Passing to printToCommand()
    desiredValues = [R1_t, sum_t, ratio_t, L1_t, Cout_t, I_D_t];
    calculatedValues = [sum, ratio, L1_calc, Cout_calc, I_D_calc];
    selectedValues = [Vout, R2, R1, L1, I_L1, Cout, I_D_ave, Vb];
    miscValues = [ratio_resultStr];

    str110 = [R2_1Str, R1_1Str, Cout_10Str];
    strRngs = [Vout_rngStr, R2_rngStr, R1_rngStr, sum_rngStr, ratio_rngStr, ...
        L1_calc_rngStr, L1_rngStr, I_L1_rngStr, Cout_calc_rngStr, Cout_rngStr, ...
        I_D_calc_rngStr, I_D_ave_rngStr, Vb_rngStr];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % Command Window Section
    % Prints values to the Command Window for use of checking what you should have
    %   calculated, what you did calculate, and other information.
    printToCommand(desiredValues, calculatedValues, selectedValues, miscValues, str110, strRngs);
end

% If the value is a resistance or capacitance, then check to see 
%   that the value is a standard value. Checks to see that the 
%   value is within the required range. Then returns a string
%   for whether the value meets the desired requirements. 
%   The string is for the Command Window.
function [strStnd, strRng] = checkVal(str,value,lowerBound,upperBound)
    % 1% resistor and 10% capacitor vectors
    resVals = [10.0, 10.2, 10.5, 10.7, 11.0, 11.3, 11.5, 11.8, 12.1, 12.4, 12.7, 13.0, ...
        13.3, 13.7, 14.0, 14.3, 14.7, 15.0, 15.4, 15.8, 16.2, 16.5, 16.9, 17.4,...
        17.8, 18.2, 18.7, 19.1, 19.6, 20.0, 20.5, 21.0, 21.5, 22.1, 22.6, 23.2,...
        23.7, 24.3, 24.9, 25.5, 26.1, 26.7, 27.4, 28.0, 28.7, 29.4, 30.1, 30.9,...
        31.6, 32.4, 33.2, 34.0, 34.8, 35.7, 36.5, 37.4, 38.3, 39.2, 40.2, 41.2,...
        42.2, 43.2, 44.2, 45.3, 46.4, 47.5, 48.7, 49.9, 51.1, 52.3, 53.6, 54.9,...
        56.2, 57.6, 59.0, 60.4, 61.9, 63.4, 64.9, 66.5, 68.1, 69.8, 71.5, 73.2,...
        75.0, 76.8, 78.7, 80.6, 82.5, 84.5, 86.6, 88.7, 90.9, 93.1, 95.3, 97.6];
    resVals = round([1e4*resVals 1e5*resVals],0);
    capVals = round(1e-6*[10, 12, 15, 18, 22, 27, 33, 39, 47, 56, 68, 82],6);
  
    % Convert the string to a character array so that we can extract the first letter.
    c = convertStringsToChars(str);
    
    % Get the base symbol (µ, m, k, M, etc.) and scale the bounds accordingly.
    [symbolL, newLowerBound] = checkBase(lowerBound);
    [symbolU, newUpperBound] = checkBase(upperBound);

    % See if we are working with a ratio, resistance, capacitance, voltage, amperage, or inductance.
    stnd = '';
    part = '';
    unitL = '';
    unitU = '';
    if (strcmp(c,'R1/R2'))
        num = 0;
    elseif (strcmp(c(1),'R'))
        unitL = strcat(symbolL,'Ω');
        unitU = strcat(symbolU,'Ω');
        stnd = "1%";
        part = "resistor";
        num = 1;
    elseif strcmp(c(1),'C')
        unitL = strcat(symbolL,'F');
        unitU = strcat(symbolU,'F');
        stnd = "10%";
        part = "capacitor";
        num = 2;
    elseif strcmp(c(1),'V')
        unitL = 'V';
        unitU = 'V';
        num = 3;
    elseif strcmp(c(1),'I')
        unitL = strcat(symbolL,'A');
        unitU = strcat(symbolU,'A');
        num = 4;
    else
        unitL = strcat(symbolL,'H');
        unitU = strcat(symbolU,'H');
        num = 5;
    end

    % Checks if the resistor or capacitor value is a standard value.
    if  (num==1 && any(resVals==value))
        strStnd = sprintf("%s is a standard %s %s value.", str, stnd, part);
    elseif  (num==2 && any(capVals==value))
        strStnd = sprintf("%s is a standard %s %s value.", str, stnd, part);
    else
        strStnd = sprintf("<strong>*****%s is not a standard %s %s value.*****</strong>", str, stnd, part);  
    end

    % Checks if the value is within the required range
    if (value >= lowerBound && value <= upperBound && num==0)
        strRng = sprintf("%s does satisfy %.1f ≤ %s ≤ %.1f.", str, newLowerBound, str, newUpperBound);
    elseif (value >= lowerBound && value <= upperBound)
        strRng = sprintf("%s does satisfy %.1f %s ≤ %s ≤ %.1f %s.", str, newLowerBound, unitL, str, newUpperBound, unitU);
    else
        strRng = sprintf("<strong>*****%s does not satisfy %.1f %s ≤ %s ≤ %.1f %s.*****</strong>", str, newLowerBound, unitL, str, newUpperBound, unitU);
    end
end

% Determines the symbol needed for units. Then adjusts the
%   bounds as necessary.
function [symbol, bound] = checkBase(bound)
    if bound*1e9>=1 && bound*1e9<1000
        symbol = 'n';
        bound = bound*1e9;
    elseif bound*1e6>=1 && bound*1e6<1000
        symbol = 'µ';
        bound = bound*1e6;
    elseif bound*1e3>=1 && bound*1e3<1000
        symbol = 'm';
        bound = bound*1e3;
    elseif bound/1e3>=1 && bound/1e3<1000
        symbol = 'k';
        bound = bound/1e3;
    elseif bound/1e6>=1 && bound/1e6<1000
        symbol = 'M';
        bound = bound/1e6;
    else 
        symbol = '';
    end
end

% Displays results to the Command Window. 
function [] = printToCommand(des, calc, sel, misc, str110, strRng)
    lines = "--------------------------------------------------------------------------------------------------------\n";

    fprintf(lines);
    fprintf(lines);
    fprintf("<strong>SWITCHING REGULATOR PROJECT CALCULATIONS</strong> \n");
    fprintf("Created by Tau Beta Pi member Riley Corbin \n")
    
    % Table Entry Values
    fprintf(lines);
    fprintf(lines);
    fprintf("<strong>Table Entry Values </strong>\n\n");
    fprintf('Vout = %.2f V \n', sel(1));                                   % Selected Vout
    fprintf("R2 = %.3f MΩ \n", sel(2)/1e6);                          % Selected R2
    fprintf("R1 = %.3f MΩ \n", sel(3)/1e6);                          % Selected R1
    fprintf("R1+R2 = %.2f MΩ \n", calc(1)/1e6);                  % Sum of selected R1 and R2
    fprintf("L1_calc = %.2f µH \n", calc(3)*1e6);                   % Calculated L1 
    fprintf("L1 = %.1f µH \n", sel(4)*1e6);                            % Selected L1
    fprintf("L1 Current Rating = %.1f A \n", sel(5));             % Current rating of L1
    fprintf("Cout_calc = %.1f µF \n", calc(4)*1e6);                % Calculated Cout
    fprintf("Cout = %.1f µF \n", sel(6)*1e6);                         % Selected Cout
    fprintf("I_D_calc = %.1f mA \n", calc(5)*1e3);                 % Calculated I_D
    fprintf("I_D_ave = %.1f mA \n", sel(7)*1e3);                   % Average forward current of the selected diode
    fprintf("D1 Breakdown Voltage = %d V \n", sel(8));   % Breakdown voltage of the selected diode
    
    % R2 and R1 calculations
    fprintf(lines);
    fprintf(lines);
    fprintf("<strong>R2 and R1 Calculations </strong> \n\n");
    fprintf('R2 = %.3f MΩ \n', sel(2)/1e6);                      % Selected R2
    fprintf('R1_t = %.3f MΩ \n', des(1)/1e6);                  % Desired R1 for a given R2
    fprintf('R1 = %.3f MΩ \n', sel(3)/1e6);                      % Selected R1
    fprintf('R1_t+R2 = %.2f MΩ \n', des(2)/1e6);           % Desired sum of R1 and R2
    fprintf('R1+R2 = %.2f MΩ \n', calc(1)/1e6);             % Calculated sum of R1 and R2
    fprintf('R1_t/R2 = %.3f \n', des(3));                          % Desired ratio of R1 and R2
    fprintf('R1/R2 = %.3f \n\n', calc(2));                         % Calculated ratio of R1 and R2
    fprintf("%s \n", strRng(1));        % Vout in range
    fprintf("%s \n", strRng(2));        % R2 in range
    fprintf("%s \n", strRng(3));        % R1 in range
    fprintf("%s \n", strRng(4));        % R1+R2 in range
    fprintf("%s \n", strRng(5));        % Ratio in range
    fprintf("%s \n", misc(1));           % Ratio gives you exact, within ±1% of exact, or not within ±1% of desired ratio
    fprintf("%s \n", str110(1));        % R2 1%
    fprintf("%s \n", str110(2));        % R1 1%

    % L1 Calculations 
    fprintf(lines);
    fprintf(lines);
    fprintf("<strong>L1 Calculations</strong>\n\n");
    fprintf("L1_t = %.2f µH \n", des(4)*1e6);                           % Desired L1
    fprintf("L1_calc = %.2f µH \n", calc(3)*1e6);                     % Calculated L1
    fprintf("L1 Inductance = %.1f µH \n", sel(4)*1e6);            % Selected L1
    fprintf("L1 Current Rating = %.1f A \n\n", sel(5));            % Current rating of L1
    fprintf("%s \n", strRng(6));        % L1_calc in range
    fprintf("%s \n", strRng(7));        % L1 in range
    fprintf("%s \n", strRng(8));        % Current rating of L1 in range
    
    % Cout calculations
    fprintf(lines);
    fprintf(lines);
    fprintf("<strong>Cout Calculations </strong>\n\n");
    fprintf("Cout_t = %.1f µF \n", des(5)*1e6);        % Desired Cout
    fprintf("Cout_calc = %.1f µF \n", calc(4)*1e6);   % Calculated Cout
    fprintf("Cout = %.1f µF \n\n", sel(6)*1e6);         % Selected Cout
    fprintf("%s \n", strRng(9));      % Cout_calc in range
    fprintf("%s \n", strRng(10));    % Cout in range
    fprintf("%s \n", str110(3));       % Cout 10%

    % I_D calculations
    fprintf(lines);
    fprintf(lines);
    fprintf("<strong> I_D Calculations</strong>\n\n");
    fprintf("I_D_t = %.1f mA \n", des(6)*1e3);                                % Desired diode current
    fprintf("I_D_calc = %.1f mA \n", calc(5)*1e3);                          % Calculated average diode current
    fprintf("I_D_ave = %.1f mA \n", sel(7)*1e3);                             % Average forward current of the selected diode
    fprintf("D1 Breakdown Voltage = %d V \n\n", sel(8));             % Breakdown voltage of the selected diode
    fprintf("%s \n", strRng(11));           % I_D_calc in range
    fprintf("%s \n", strRng(12));           % I_D_ave in range
    fprintf("%s \n", strRng(13));           % Breakdown voltage in range
end
