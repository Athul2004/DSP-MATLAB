clc; 
clear all; 
close all;
x = input('enter the array:'); % Prompts the user to enter the first sequence (array) and stores it in `x`.
h = input('enter the array:'); % Prompts the user to enter the second sequence (array) and stores it in `h`.
k = length(x); % Stores the length of the first sequence `x` in `k`.
m = length(h); % Stores the length of the second sequence `h` in `m`.
N = (k + m) - 1; % Computes the length of the result sequence `N`, which is `k + m - 1`.
X = [x, zeros(1, (N - k))]; % Pads `x` with zeros to make its length equal to `N`.
H = [h, zeros(1, (N - m))]; % Pads `h` with zeros to make its length equal to `N`.
for i = 1:N          % Loop over each element in the output `y`.
    y(i) = 0;        % Initialize `y(i)` to zero.
    for j = 1:N      % Loop over each element in the input sequence `X`.
        s = mod(i - j, N);  % Compute the circular index `s` to ensure wrapping.
        y(i) = y(i) + X(j) * H(s + 1); % Accumulate the product of `X(j)` and `H(s + 1)` in `y(i)`.
    end
end
disp(y); % Display the result of the manual circular convolution in the command window.
subplot(2,2,1);    % Select the 1st subplot position in a 2x2 grid.
stem(x);           % Plot the first sequence `x` using a stem plot.
title('first sequence'); % Title for the first sequence plot.

subplot(2,2,2);    % Select the 2nd subplot position.
stem(h);           % Plot the second sequence `h` using a stem plot.
title('second sequence'); % Title for the second sequence plot.

subplot(2,2,3);    % Select the 3rd subplot position.
stem(y);           % Plot the manually computed circular convolution result `y`.
title('convolution without built-in fn'); % Title for the manual convolution result plot.
T = cconv(x, h, N); % Compute the circular convolution of `x` and `h` with length `N` using `cconv`.
disp(T);            % Display the result of `cconv` in the command window.
subplot(2,2,4);    % Select the 4th subplot position.
stem(T);           % Plot the result of the built-in circular convolution.
title('convolution with built-in fn'); % Title for the `cconv` result plot.
