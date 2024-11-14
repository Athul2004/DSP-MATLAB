clc;                      % Clear the command window
clear all;                % Clear all variables from the workspace
close all;                % Close all open figure windows

x1 = input('enter 1st sequence'); % Prompt the user to enter the first sequence x1
l1 = length(x1);          % Calculate the length of x1 and store it in l1

x2 = input('enter 2nd sequence'); % Prompt the user to enter the second sequence x2
l2 = length(x2);          % Calculate the length of x2 and store it in l2

N = input('enter point '); % Ask the user to specify the number of points N for the Fourier Transform

% Check if the lengths of x1 or x2 are greater than N
% If so, display an error message and stop execution
if l1 > N  
    error('cannot be performed'); 
elseif l2 > N 
    error('cannot be performed'); 
end

x1 = [x1, zeros(1, N - l1)]; % Pad x1 with zeros to make its length equal to N
x2 = [x2, zeros(1, N - l2)]; % Pad x2 with zeros to make its length equal to N

a = conj(x2);               % Compute the complex conjugate of x2 and store it in a
b = x1 .* a;                % Element-wise multiplication of x1 and conjugate of x2, stored in b

c = fft(x1, N);             % Compute the N-point Fourier Transform of x1 and store it in c
d = fft(x2, N);             % Compute the N-point Fourier Transform of x2 and store it in d
f = conj(d);                % Compute the complex conjugate of d (the Fourier Transform of x2) and store it in f

e = c .* f;                 % Element-wise multiplication of Fourier Transforms (c and conjugate of d), stored in e

z = sum(b);                 % Sum all elements of b (which is x1 .* conj(x2)) and store it in z
r = (sum(e)) / N;           % Sum all elements of e (c .* conj(d)) and divide by N, store it in r

disp(z);                    % Display the result of z, which is the sum of the product in the time domain
disp(r);                    % Display the result of r, which is the average of the product in the frequency domain
