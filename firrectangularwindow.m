clc;                            % Clear the command window
ylabel('gain(dB)');             % Set default label for y-axis as 'gain(dB)'
close all;                      % Close all figure windows
clear all;                      % Clear all variables from the workspace

% User inputs
rp = input('Enter the passband ripple=');  % Input for passband ripple (dB)
rs = input('Enter the stopband ripple=');  % Input for stopband ripple (dB)
fp = input('Enter the passband frequency='); % Input for passband frequency (Hz)
fs = input('Enter the stopband frequency='); % Input for stopband frequency (Hz)
f = input('Enter the sampling frequency='); % Input for sampling frequency (Hz)

% Normalized passband and stopband frequencies
wp = 2 * fp / f;                % Normalize passband frequency by sampling frequency
ws = 2 * fs / f;                % Normalize stopband frequency by sampling frequency

% Filter order calculation
num = -20 * log10(sqrt(rp * rs)) - 13;  % Numerator for filter order calculation based on ripples
den = 14.6 * (fs - fp) / f;             % Denominator for filter order calculation
n = ceil(num / den);                    % Calculate minimum filter order, rounding up

% Adjust filter order to be even
n1 = n + 1;                     % Set n1 to n + 1 for window length
if rem(n, 2) ~= 0               % If n is odd, make it even
    n1 = n;                     % Set n1 to n
    n = n - 1;                  % Make n even by decrementing by 1
end

y = rectwin(n1);                % Create a rectangular window of length n1

% LOW PASS FILTER
b = fir1(n, wp, y);             % Design FIR low-pass filter using order n, cutoff wp, window y
[h, o] = freqz(b, 1, 256);      % Compute frequency response of filter with 256 points
m = 20 * log10(abs(h));         % Calculate gain in dB

% Plot magnitude response of Low-pass filter
subplot(4, 2, 1);               % Select subplot 1 of 8 for the magnitude response
plot(o / pi, m);                % Plot normalized frequency vs magnitude
title('1. Low Pass Filter');    % Title for Low-pass filter
ylabel('Gain(dB)');             % Label y-axis as Gain(dB)
xlabel('Normalized Frequency'); % Label x-axis as Normalized Frequency

% Plot phase response of Low-pass filter
subplot(4, 2, 2);               % Select subplot 2 of 8 for phase response
lp = angle(h);                  % Calculate phase response of Low-pass filter
plot(o / pi, lp);               % Plot normalized frequency vs phase
title('1. Low Pass Filter');    % Title for Low-pass filter
ylabel('Phase');                % Label y-axis as Phase
xlabel('Normalized Frequency'); % Label x-axis as Normalized Frequency

% HIGH PASS FILTER
b = fir1(n, wp, 'high', y);     % Design FIR high-pass filter using order n, cutoff wp, window y
[h, o] = freqz(b, 1, 256);      % Compute frequency response of filter with 256 points
m = 20 * log10(abs(h));         % Calculate gain in dB

% Plot magnitude response of High-pass filter
subplot(4, 2, 3);               % Select subplot 3 of 8 for the magnitude response
plot(o / pi, m);                % Plot normalized frequency vs magnitude
title('2. High Pass Filter');   % Title for High-pass filter
xlabel('Normalized Frequency'); % Label x-axis as Normalized Frequency

% Plot phase response of High-pass filter
subplot(4, 2, 4);               % Select subplot 4 of 8 for phase response
hp = angle(h);                  % Calculate phase response of High-pass filter
plot(o / pi, hp);               % Plot normalized frequency vs phase
title('2. High Pass Filter');   % Title for High-pass filter
ylabel('Phase');                % Label y-axis as Phase
xlabel('Normalized Frequency'); % Label x-axis as Normalized Frequency

% BAND PASS FILTER
wn = [wp, ws];                  % Define passband range for Band-pass filter
b = fir1(n, wn, y);             % Design FIR Band-pass filter using order n, passband wn, window y
[h, o] = freqz(b, 1, 256);      % Compute frequency response of filter with 256 points
m = 20 * log10(abs(h));         % Calculate gain in dB

% Plot magnitude response of Band-pass filter
subplot(4, 2, 5);               % Select subplot 5 of 8 for the magnitude response
plot(o / pi, m);                % Plot normalized frequency vs magnitude
title('3. Band Pass Filter');   % Title for Band-pass filter
ylabel('Gain(dB)');             % Label y-axis as Gain(dB)
xlabel('Normalized Frequency'); % Label x-axis as Normalized Frequency

% Plot phase response of Band-pass filter
subplot(4, 2, 6);               % Select subplot 6 of 8 for phase response
bp = angle(h);                  % Calculate phase response of Band-pass filter
plot(o / pi, bp);               % Plot normalized frequency vs phase
title('3. Band Pass Filter');   % Title for Band-pass filter
ylabel('Phase');                % Label y-axis as Phase
xlabel('Normalized Frequency'); % Label x-axis as Normalized Frequency

% BAND STOP FILTER
b = fir1(n, wn, 'stop', y);     % Design FIR Band-stop filter using order n, stopband wn, window y
[h, o] = freqz(b, 1, 256);      % Compute frequency response of filter with 256 points
m = 20 * log10(abs(h));         % Calculate gain in dB

% Plot magnitude response of Band-stop filter
subplot(4, 2, 7);               % Select subplot 7 of 8 for the magnitude response
plot(o / pi, m);                % Plot normalized frequency vs magnitude
title('4. Band Stop Filter');   % Title for Band-stop filter
ylabel('Gain(dB)');             % Label y-axis as Gain(dB)
xlabel('Normalized Frequency'); % Label x-axis as Normalized Frequency

% Plot phase response of Band-stop filter
subplot(4, 2, 8);               % Select subplot 8 of 8 for phase response
bsp = angle(h);                 % Calculate phase response of Band-stop filter
plot(o / pi, bsp);              % Plot normalized frequency vs phase
title('4. Band Stop Filter');   % Title for Band-stop filter
ylabel('Phase');                % Label y-axis as Phase
xlabel('Normalized Frequency'); % Label x-axis as Normalized Frequency
