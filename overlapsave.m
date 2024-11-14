clc;                        % Clear the command window
clear all;                  % Clear all variables from the workspace
close all;                  % Close all figure windows

x = input('Enter the 1st sequence:'); % Prompt user to input the first sequence (signal) x
h = input('Enter the 2nd sequence:'); % Prompt user to input the second sequence (impulse response) h
N = input('Enter the block length:'); % Prompt user to input the block length N

Nx = length(x);             % Calculate the length of the sequence x
M = length(h);              % Calculate the length of the sequence h (impulse response)
M1 = M - 1;                 % M1 is the overlap length, which is one less than the length of h
NL = Nx + M1;               % Total output length after convolution
L = N - M1;                 % Length of the non-overlapping part of each block

x1 = [zeros(1, M1), x, zeros(1, N - 1)]; % Pad x with M1 zeros at the start and N-1 zeros at the end
h1 = [h, zeros(1, N - M)];  % Pad h with zeros to make its length equal to the block length N

% Check if the block length N is less than the length of h
% If so, display an error message and terminate
if N < M  
    error('N must be >= M');  
end  

k = NL / L;                 % Calculate the number of blocks (k) needed to process x

% Adjust k to be the smallest integer that is greater than or equal to NL / L
if (floor(k) == k)  
    k = k;                  % If k is already an integer, use it as is
else  
    k = floor(k) + 1;       % Otherwise, take the next integer by rounding up
end  

y = [zeros(k, N)];          % Initialize output matrix y to store the results of each block

% Loop through each block to perform convolution
for i = 0:1:k-1  
    xk = x1(i * L + 1 : i * L + N); % Extract the current block xk of length N from x1
    xk                             % Display the current block (optional debugging output)
    y(i + 1, :) = cconv(xk, h1, N); % Compute circular convolution of xk with h1 of length N
    y                              % Display the result for the current block (optional debugging output)
end  

y = y(:, M:N)';             % Discard the overlap by taking only columns M to N of each row, then transpose
y = y(:)';                  % Convert the matrix y to a single row vector by concatenating columns
y = y(1:NL);                % Trim y to the final length NL

disp('Convolution using overlap save method:'); % Display result header
disp(y);                    % Display the final result of convolution using the overlap-save method

s = conv(x, h);             % Perform linear convolution of x and h using MATLAB's built-in function
disp('Convolution using built-in function:'); % Display result header for the built-in function
disp(s);                    % Display the result from the built-in convolution function
