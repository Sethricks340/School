function [ ny, y ] = E380L2H( nx, x, H )
% [ny, y] = E380L2H(nx, x, H)
%
% Variable Name  |  Description
%   x            |  Input signal vector
%   y            |  Output signal vector
%  nx            |  Input time vector
%  ny            |  Output time vector
%   H            |  System selector scalar (1, 2, or 3)

% check number of input arguments
if nargin < 1
    error('Please provide input arguments');
elseif nargin < 2
    H = 0; % if only 1 argument, it must be the signal
    x = nx; % x should get the value of nx (first argument)
    nx = 0:1:(length(x)-1); % time vector abritrarily selected
elseif nargin < 3 
    if isscalar(x) %check if x is scalar
        H = x; % then that's our H
        x = nx % the other argument must be the signal
        nx = 0:1:(length(x)-1); % arbitrary time vector
    else
        H = 0; %no H specified
    end
else
    %intentionally empty
end

if ~isvector(nx)
    error('nx must be a vector')
end

if ~isvector(x)
    error('x must be a vector')
end

if ~isscalar(H)
    error('H must be a scalar')
end

if length(nx) ~= length(x)
    error('Input vector must be same length as time vector')
end

%for each system, if no output variable is specified or if only one
%variable is specified, the result is returned without time vector

if H == 1; % define first system
    if nargout < 2 % 
        ny = 2 * abs(x);
    else
        y = 2 * abs(x);
        ny = nx;
    end
elseif H == 2 % define the second system
    if nargout < 2
        ny = x / 3;
        ny = [0 0 ny] + [0 ny 0] + [ ny 0 0];
    else
        y = x / 3;
        y = [0 0 y] + [0 y 0] + [ y 0 0];
        if length(nx) > 1
            s = nx(2) - nx(1);
            ny = [nx(1)-2*s nx(1)-s nx];
        else
            ny = nx;
        end
    end
elseif H == 3 % define the third system
    if nargout < 2
        ny = exp(-(nx > 0)) .* sin(x);
    else
        y = exp(-(nx > 0)) .* sin(x);
        ny = nx;
    end
else % any other H returns the same input signal
    if nargout < 2
        ny = x;
    else
        y = x;
        ny = nx;
    end
end