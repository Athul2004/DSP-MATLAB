clc; 
clear all; 
close all;
x = input('enter 1st sequence'); % Prompts the user to enter the input sequence `x`.
L = length(x);                   % Stores the length of the input sequence `x` in `L`.
N = input('enter point of idft'); % Prompts the user to enter the desired IDFT length `N`.
if N < L
    error('idft cannot be performed') % Throws an error if `N` is smaller than the sequence length `L`.
end
x = [x, zeros(1, N - L)]; % Pads `x` with zeros to make its length equal to `N`.
for k = 1:N                  % Loop over each element in the output sequence `X`.
    X(k) = 0;                % Initialize `X(k)` to zero.
    for n = 1:N              % Loop over each element in the input sequence `x`.
        X(k) = X(k) + (x(n) * exp(j * 2 * pi * (k - 1) * (n - 1) / N)) / N; % Calculate IDFT term and add to `X(k)`.
    end
end
disp(X); % Display the manually computed IDFT result `X`.
subplot(2,2,1);            % Select the 1st subplot position in a 2x2 grid.
stem(X);                   % Plot the manually computed IDFT result `X` using a stem plot.
title('idft without built in function'); % Title for manual IDFT plot.
xlabel('position');        % Label the x-axis.
ylabel('amplitude');       % Label the y-axis.
v = ifft(x, N); % Computes the IDFT of `x` with length `N` using MATLAB’s `ifft` function.
disp(v);        % Display the result of `ifft`.
subplot(2,2,2);            % Select the 2nd subplot position.
stem(v);                   % Plot the result of the built-in IDFT using a stem plot.
title('idft with built in function'); % Title for built-in IDFT plot.
xlabel('position');        % Label the x-axis.
ylabel('amplitude');       % Label the y-axis.

