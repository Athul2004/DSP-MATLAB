clc;
clear all;
close all;

% Input sequences and start points
x = input('Enter first sequence: ');
h = input('Enter second sequence: ');
T = input('Enter start point of first sequence: ');
K = input('Enter start point of second sequence: ');

% Sequence lengths and total length of convolution
L = length(x);
M = length(h);
N = L + M - 1;

% Zero-padding
X = [x, zeros(1, N-L)];
H = [h, zeros(1, N-M)];

% Time indices for input and output sequences
t = T:(T+L)-1;
r = K:(K+M)-1;
a = (T+K):(N+T+K-1);

% Manual convolution
y = zeros(1, N);
for i = 1:N
    for j = 1:i
        y(i) = y(i) + X(j) * H(i-j+1);
    end
end

% Built-in convolution
z = conv(x, h);

% Display results
disp(y);
disp(z);

% Plotting
subplot(2,2,1);
stem(t, x);
title('First Sequence');
xlabel('Time Index');
ylabel('Amplitude');

subplot(2,2,2);
stem(r, h);
title('Second Sequence');
xlabel('Time Index');
ylabel('Amplitude');

subplot(2,2,3);
stem(a, y);
title('Convolution Result (Manual)');
xlabel('Time Index');
ylabel('Amplitude');

subplot(2,2,4);
stem(a, z);
title('Convolution Result (Built-in)');
xlabel('Time Index');
ylabel('Amplitude');