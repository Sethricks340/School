% Author: Riley Corbin (member of Tau Beta Pi, 6/30/2023)
% Tested On MATLAB Version R2023a and MATLAB Online
% Description:
%   This file is to be used by the student to check their calculations. The student is to run the 
%       script and then enter their values in the Command Window as prompted.
%   You can see information regarding your values in the Command Window. You can see
%       desired and calculated/selected values, if you chose 5% resistor or 10% capacitor values, 
%       are within the given ranges, if you have selected the correct Rf and R1 values for the 
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
    disp("Vout = 2");
    disp("R5 = 3.2");
    disp("Rbias2 = 14e3");
    disp("R1 = 37e3");
    disp("Rf = 17e3");
    disp("Cf = 150e-6");
    disp("-----------------------------------------------------");
    disp("");

    % Takes user input from the Command Window for each value.
    Vout = input("<strong>Vout =  </strong>");
    R5 = input("<strong>R5 = </strong>");
    Rbias2 = input("<strong>Rbias2 = </strong>");
    R1 = input("<strong>R1 = </strong>");
    Rf = input("<strong>Rf = </strong>");
    Cf = input("<strong>Cf = </strong>"); 

    clc
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % Constants Section
    Vin_max = 21;       % Maximum input voltage
    Vin_min = 12;        % Minimum input voltage
    Vout_min = 2.5;     % Minimum output voltage
    Vout_max = 9;      % Maximum output voltage
    V_zener = 2.5;       % Breakdown voltage of the LM385-2.5 2.5V Voltage Regulator Diode
    V_t = 0.7;               % Threshold voltage of pn-junction diodes D1 and D2.
    V_R5 = 0.66;         % Voltage drop across the current limiting resistor R5
    V_Rt = 1;               % Theoretical/desired ripple voltage
    
    T_amb = 50;          % Ambient temperature
    T_max = 175;        % Maximum operating temperature of the N-Channel MOSFET
    R_therm = 62.5;    % Thermal resistance of the N-Channel MOSFET
    freq = 120;            % Input frequency from AC source
   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % R5 and I_calc Section
    deltaT = T_max - T_amb;         % Max temperature change of MOSFET
    Power = deltaT / R_therm;       % Max power dissipation of MOSFET
    V_MOS = (Vin_max - V_t) - (V_R5 + Vout);   % Voltage across MOSFET
    I_calc_t = Power / V_MOS;              % Desired current limit
    R5_t = V_R5 / I_calc_t;                     % Desired resistor value for R5 
    I_calc = V_R5 / R5;                          % Actual current limit

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % Rbias2 and I_bias2 for V_in=21 V Section
    V_Rbias2_min = (Vin_min - V_t) - V_zener;             % Actual minimum voltage across Rbias2
    I_Rbias2_min = V_Rbias2_min / Rbias2;                  % Actual minimum current across Rbias2
    V_Rbias2_max = (Vin_max - V_t) - V_zener;            % Actual maximum voltage across Rbias2
    I_Rbias2_max = V_Rbias2_max / Rbias2;                 % Actual maximum current across Rbias2
    I_Rbias2 = I_Rbias2_max;                                        % Actual maximum current across Rbias2
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % R1, Rf, and I_R1 Section
    ratio_t =  (Vout / V_zener) - 1;      % Calculated Rf/R1 ratio using the gain equation
    Rf_t = R1 * ratio_t;                        % Calculated Rf resistor value to achieve the desired Rf/R1 ratio using chosen R1 value
    ratio = Rf / R1;                              % Actual Rf/R1 ratio using the values chosen for Rf and R1
    I_R1 = V_zener / R1;                     % Actual current across R1

    if Vout==2.5
        Rf_t = 1e3;
    end
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % Cf and V_R for I_load=0.9*I_calc Section
    I_load = I_calc;                               % Maximum load current that was calculated earlier using (0.66 V)/R5
    Cf_t = I_load / (freq * V_Rt);           % Calculated filter capacitor value assuming max load current and ripple voltage of 1 V
    V_R = I_load / (freq * Cf);               % Actual ripple voltage with the chosen filter capacitor
    V_R90 = 0.9*V_R;                           % Actual ripple voltage when operating at 90% max load current
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % Range Check Section
    % Check to see if the given/student values are within range. If the value is a resistor or capacitor,
    %   then it also checks if it is a standard 1% resistor or 10% capacitor value.
    [~ , Vout_rngStr] = checkVal('Vout', Vout, Vout_min, Vout_max);
    [R5_5Str, R5_rngStr] = checkVal('R5',R5,3.6,6.2);

    [Rbias2_5Str, Rbias2_rngStr] = checkVal('Rbias2',Rbias2,18e3,88e3);
    [~, I_Rbias2_rngStr] = checkVal('I_Rbias2',I_Rbias2,100e-6,1e-3);

    [R1_5Str,R1_rngStr] = checkVal('R1',R1,2.5e3,250e3);
    [Rf_5Str,Rf_rngStr] = checkVal('Rf',Rf,2.5e3,250e3);
    [~, I_R1_rngStr] = checkVal('I_R1',I_R1,10e-6,1e-3);
    
    [Cf_10Str, Cf_rngStr] = checkVal('Cf',Cf,560e-6,1000e-6);
    [~, V_R90_rngStr] = checkVal('V_R90',V_R90,0,1.5);

    % Check to see what ratio range the chosen R1 and Rf values will yield.
    if (ratio == ratio_t)
        ratioResultStr = "R1 and Rf will get you the desired ratio.";
    elseif (ratio>=0.98*ratio_t && ratio<=1.02*ratio_t)
        ratioResultStr = "R1 and Rf will get you within ±2% of your desired ratio.";
    else
        ratioResultStr = "<strong>*****R1 and Rf will not get you within ±2% of your desired ratio.*****</strong>";
    end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % Creating Vectors for Passing to printToCommand()
    desiredValues = [R5_t, I_calc_t, Rf_t, ratio_t, Cf_t, V_Rt];
    actualValues = [Vout, R5, I_calc, Rbias2, I_Rbias2, R1, Rf, ratio, I_R1, Cf, V_R90];

    strs510 = [R5_5Str, Rbias2_5Str, R1_5Str, Rf_5Str, Cf_10Str];
    strsRng = [Vout_rngStr, R5_rngStr, Rbias2_rngStr, I_Rbias2_rngStr, R1_rngStr, Rf_rngStr, ...
        I_R1_rngStr, Cf_rngStr, V_R90_rngStr];
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % Command Window Section
    % Prints values to the Command Window for use of checking what the student should have
    %   calculated, what they did calculate, and other information.
    printToCommand(desiredValues, actualValues, strs510, strsRng, ratioResultStr);
end

% If the value is a resistance or capacitance, then check to see 
%   that the value is a standard value. Checks to see that the 
%   value is within the required range. Then returns a string and 
%   boolean for whether the value meets the desired requirements. 
%   The string is for the Command Window and the boolean is for 
%   the table formatting.
function [strStnd, strRng] = checkVal(str,value,lowerBound,upperBound)
    % 5% resistor and 10% capacitor arrays    
    resVals = [10, 11, 12, 13, 15, 16, 18, 20, 22, 24, 27, 30, 33, ...
        36, 39, 43, 47, 51, 56, 62, 68, 75, 82, 91];
    resVals = round([0.1*resVals resVals 10*resVals 100*resVals 1e3*resVals 10e3*resVals],1);
    capVals = [10, 12, 15, 18, 22, 27, 33, 39, 47, 56, 68, 82];
    capVals = round([capVals./1e5 capVals./1e4],5);

    % Convert the string to a character array so that we can extract the first letter.
    c = convertStringsToChars(str);
    
    % Get the base symbol (µ, m, k, M, etc.) and scale the bounds accordingly.
    [symbolL, newLowerBound] = checkBase(lowerBound);
    [symbolU, newUpperBound] = checkBase(upperBound);

    % See if we are working with a resistance, capacitance, voltage, or amperage.
    stnd = '';
    part = '';
    if (strcmp(c(1),'R'))
        unitL = strcat(symbolL,'Ω');
        unitU = strcat(symbolU,'Ω');
        stnd = "5%";
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
    else
        unitL = strcat(symbolL,'A');
        unitU = strcat(symbolU,'A');
        num = 4;
    end

    % Checks if the resistor or capacitor value is a standard value.
    if  (num==1 && any(resVals==value))
        strStnd = sprintf("%s is a standard %s %s value.", str, stnd, part);
    elseif  (num==2 && any(capVals==value))
        strStnd = sprintf("%s is a standard %s %s value.", str, stnd, part);
    else
        strStnd = sprintf("<strong>*****%s is not a standard %s %s value.*****</strong>", str, stnd, part);  
    end

    % Checks if the value is within the required range.
    if (value >= lowerBound && value <= upperBound)
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

% Displays results to the Command Window. The same information
%   is contained within the displayed tables.
function [] = printToCommand(des, act, str510, strRng, ratioStr)
    lines = "--------------------------------------------------------------------------------------------------------\n";

    fprintf(lines);
    fprintf(lines);
    fprintf("<strong>POWER SUPPLY PROJECT CALCULATIONS</strong> \n");
    fprintf("Created by Tau Beta Pi member Riley Corbin \n")
    
    % Table Entry Values
    fprintf(lines);
    fprintf(lines);
    fprintf("<strong>Table Entry Values </strong>\n\n");
    fprintf('Vout = %.2f V \n', act(1));                        % Selected Vout
    fprintf("R5 = %0.1f Ω \n", act(2));                        % Selected R5
    fprintf("I_calc = %.1f mA \n", act(3)*1e3);           % Calculated I_calc
    fprintf("R_bias2 = %d kΩ \n", act(4)/1e3);           % Selected R_bias2
    fprintf("I_Rbias2 = %.1f µA \n", act(5)*1e6);        % Calculated I_Rbias2
    fprintf("R1 = %.1f kΩ \n", act(6)/1e3);                 % Selected R1
    fprintf("Rf = %.1f kΩ \n", act(7)/1e3);                  % Selected Rf
    fprintf("I_R1 = %.1f µA \n", act(9)*1e6);               % Calculated I_R1
    fprintf("Cf = %d µF \n", act(10)*1e6);                  % Selected Cf
    fprintf("V_R90 = %.2f V \n", act(11));                   % Calculated V_R90
    
    % R5 and I_calc calculations
    fprintf(lines);
    fprintf(lines);
    fprintf("<strong>R5 and I_calc Calculations </strong>\n\n");
    fprintf('R5_t = %.2f Ω \n', des(1));                   % Desired R5
    fprintf('R5 = %.1f Ω \n', act(2));                       % Selected R5
    fprintf('I_calc_t = %.1f mA \n', des(2)*1e3);     % Desired I_calc
    fprintf('I_calc = %.1f mA \n\n', act(3)*1e3);     % Calculated I_calc
    fprintf("%s \n", strRng(1));        % Vout in range
    fprintf("%s \n", strRng(2));        % R5 in range
    fprintf("%s \n", str510(1));        % R5 5%

    % R_bias2 and I_bias2 Calculations 
    fprintf(lines);
    fprintf(lines);
    fprintf("<strong>Rbias2 and I_Rbias2 Calculations </strong>\n\n");
    fprintf("Rbias2 = %d kΩ \n", act(4)/1e3);               % Selected Rbias2
    fprintf("I_Rbias2 = %.1f µA \n\n", act(5)*1e6);       % Calculated Rbias2
    fprintf("%s \n", strRng(3));        % Rbias2 in range
    fprintf("%s \n", strRng(4));        % I_Rbias2 in range
    fprintf("%s \n", str510(2));         % Rbias2 5%
    
    % R1, Rf, and I_R1 Calculations
    fprintf(lines);
    fprintf(lines);
    fprintf("<strong>R1, Rf and I_R1 Calculations </strong>\n\n");
    fprintf('R1 = %.1f kΩ \n', act(6)/1e3);                   % Selected R1
    fprintf("Rf_t = %.1f kΩ \n", des(3)/1e3);               % Desired Rf
    fprintf("Rf = %.1f kΩ \n", act(7)/1e3);                   % Selected  Rf
    fprintf('Rf/R1_t = %.4f \n', des(4));                       % Desired ratio
    fprintf('Rf/R1 = %.4f \n', act(8));                           % Calculated ratio
    fprintf("I_R1 = %.1f µA \n\n", act(9)*1e6);            % Calculated I_R1
    fprintf('%s \n', strRng(5));       % R1 in range
    fprintf('%s \n', strRng(6));       % Rf in range
    fprintf('%s \n', strRng(7));       % I_R1 in range
    fprintf('%s \n', ratioStr);          % Ratio gives you exact, within ±2% of exact, or not within ±2% of desired gain
    fprintf('%s \n', str510(3));        % R1 5%
    fprintf('%s \n', str510(4));        % Rf 5%
    
    % Cf and V_R calculations
    fprintf(lines);
    fprintf(lines);
    fprintf("<strong>Cf and V_R Calculations </strong>\n\n");
    fprintf("Cf_t = %.0f µF \n", des(5)*1e6);           % Desired Cf
    fprintf("Cf = %d µF \n", act(10)*1e6);              % Selected Cf
    fprintf("V_Rt = %.2f V \n", des(6));                   % Desired V_R
    fprintf("V_R = %.2f V \n", 10/9*act(11));          % Calculated V_R
    fprintf("V_R90 = %.3f V \n\n", act(11));           % Calculated V_R at 90% I_load
    fprintf("%s \n", strRng(8));           % Cf in range    
    fprintf("%s \n", strRng(9));           % V_R90 in range
    fprintf("%s \n", str510(5));            % Cf 10%
end