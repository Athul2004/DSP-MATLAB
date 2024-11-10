clc; 
clear all; 
close all;
t = -100:0.1:100;  % Define a time vector `t` from -100 to 100 with increments of 0.1.
fm = 0.02;         % Set the frequency of the analog signal to 0.02 Hz.
x = cos(2*pi*t*fm); % Define the analog signal as a cosine wave with frequency `fm`.
subplot(2,2,1);   % Select the 1st subplot position in a 2x2 grid.
plot(t,x);        % Plot the continuous signal `x(t)` against time `t`.
xlabel('time in sec');   % Label the x-axis.
ylabel('x(t)');          % Label the y-axis.
title('continuous time signal'); % Add a title to the plot.
fs1 = 0.02;       % Sampling frequency less than twice the signal frequency (undersampling).
n = -2:2;         % Define discrete sample points from -2 to 2.
x1 = cos(2*pi*fm*n/fs1); % Sample the analog signal `x` with undersampling frequency `fs1`.
subplot(2,2,2);   % Select the 2nd subplot position.
stem(n,x1);       % Plot discrete samples using stem plot (for `x1` vs. `n`).
hold on           % Hold the plot to overlay additional plots.
plot(n,x1,':');   % Overlay a dotted line plot of the samples for visual clarity.
title('discrete time signal x(n) with fs<2fm'); % Title for undersampling plot.
xlabel('n');      % Label the x-axis.
ylabel('x(n)');   % Label the y-axis.
fs2 = 0.04;           % Set sampling frequency to twice the signal frequency (Nyquist rate).
n1 = -4:4;            % Define discrete sample points from -4 to 4.
x2 = cos(2*pi*fm*n1/fs2); % Sample the analog signal `x` at Nyquist rate `fs2`.
subplot(2,2,3);       % Select the 3rd subplot position.
stem(n1,x2);          % Plot discrete samples using stem plot (for `x2` vs. `n1`).
hold on               % Hold the plot to overlay additional plots.
plot(n1,x2,':');      % Overlay a dotted line plot of the samples.
title('discrete time signal x(n) with fs=2fm'); % Title for Nyquist sampling plot.
xlabel('n');          % Label the x-axis.
ylabel('x(n)');       % Label the y-axis.
n2 = -50:50;          % Define discrete sample points from -50 to 50.
fs3 = 0.5;            % Set sampling frequency much higher than Nyquist rate (oversampling).
x3 = cos(2*pi*fm*n2/fs3); % Sample the analog signal `x` with oversampling frequency `fs3`.
subplot(2,2,4);       % Select the 4th subplot position.
stem(n2,x3);          % Plot discrete samples using stem plot (for `x3` vs. `n2`).
hold on               % Hold the plot to overlay additional plots.
plot(n2,x3,':');      % Overlay a dotted line plot of the samples.
xlabel('n');          % Label the x-axis.
ylabel('x(n)');       % Label the y-axis.
title('discrete time signal x(n) with fs>2fm'); % Title for oversampling plot.
