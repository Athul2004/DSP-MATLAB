clc; 
close all; 
clear all;
x = input('enter the sequence :'); % Prompts the user to enter the input sequence and stores it in `x`.
N = input('enter the N point value :'); % Prompts the user to enter the DFT length `N`.
L = length(x); % Stores the length of the input sequence `x` in `L`.
if N < L
    error('input sequence is bigger'); % Throws an error if `N` is smaller than the sequence length `L`.
end
X = [zeros(1, N)]; % Initializes the DFT result array `X` with zeros of length `N`.
x1 = [x, zeros(1, N - L)]; % Pads `x` with zeros to make its length equal to `N`.
for k = 0:N-1                   % Loop over each frequency index `k` from 0 to `N-1`.
    for n = 0:N-1               % Loop over each time index `n` from 0 to `N-1`.
        X(k+1) = X(k+1) + x1(n+1) * exp(-j * 2 * pi * n * k / N); % Calculate the DFT term and add to `X(k+1)`.
    end
end
for i = 1:N
    if int32((imag(X(i)))) == 0  % If the imaginary part is effectively zero.
        X(i) = real(X(i)) + 0j;  % Set `X(i)` to its real part only.
    end
    if int32((real(X(i)))) == 0  % If the real part is effectively zero.
        X(i) = 0 + imag(X(i)) * j; % Set `X(i)` to its imaginary part only.
    end
end
disp(X); % Displays the manually computed DFT result `X`.
n = 0:L-1; % Defines the time vector `n` for the original sequence of length `L`.
k = 0:(2*pi)/N:(2*pi-(2*pi)/N); % Defines the frequency vector `k` from 0 to `2*pi`, with `N` points.
Y = fft(x, N); % Computes the DFT of `x` with length `N` using MATLAB's `fft` function.
disp(Y);       % Displays the `fft` result `Y`.
subplot(3,2,1);         % Select the 1st subplot position in a 3x2 grid.
stem(n, x);             % Plot the original sequence `x` using a stem plot.
title('sequence');      % Title for the original sequence plot.

subplot(3,2,2);         % Select the 2nd subplot position.
stem(k, abs(X));        % Plot the magnitude of the manual DFT result `X`.
title('magnitude of input sequence without using built in fn'); % Title for manual DFT magnitude plot.

subplot(3,2,3);         % Select the 3rd subplot position.
stem(k, abs(Y));        % Plot the magnitude of the built-in DFT result `Y`.
title('magnitude of input sequence using built in fn'); % Title for built-in DFT magnitude plot.

subplot(3,2,4);         % Select the 4th subplot position.
stem(k, angle(X));      % Plot the phase (angle) of the manual DFT result `X`.
title('angle of input sequence without using built in fn'); % Title for manual DFT phase plot.

subplot(3,2,5);         % Select the 5th subplot position.
stem(k, angle(Y));      % Plot the phase (angle) of the built-in DFT result `Y`.
title('angle of input sequence using built in fn'); % Title for built-in DFT phase plot.
