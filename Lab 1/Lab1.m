clear; clc; 


% X-Matrix 1000x100
load("lab1_data.mat");
% each column = one realization


%% 2.1

[r,k] = my_acs(X);

% Plot
figure;
plot(k,r)

%% 2.2

% func my_corrmtx(r,p), r is output from my_acs, 
% p = desired size of the correlation matrix. 

p = 4;

% start by sorting first column and first row. 


[R] = my_corrmtx(r,p);

%% 2.3
n = 24; % Val av realisering
my_realization = X(:,n);

%% Bartlett window scaled periodogram estimation
P = my_periodogram(my_realization,'bartlett');
% Plot the estimated power spectral density
figure()
frequency = linspace(-0.5, 0.5, numel(P));
plot(frequency, 10*log10(abs(P)));
xlabel('Normalized frequency (\omega_0)');
ylabel('Power/frequency (dB)');
grid on;

%% Hanning
P2 = my_periodogram(my_realization,'hanning');
figure()
frequency = linspace(-0.5, 0.5, numel(P2));
plot(frequency, 10*log10(abs(P2)));
xlabel('Normalized frequency (\omega_0)');
ylabel('Power/frequency (dB)');
grid on;

%% Hamming
P3 = my_periodogram(my_realization);
figure()
frequency = linspace(-0.5, 0.5, numel(P3));
plot(frequency, 10*log10(abs(P3)));
xlabel('Normalized frequency (\omega_0)');
ylabel('Power/frequency (dB)');
grid on;

%% Blackman
P4 = my_periodogram(my_realization,'blackman');
figure()
frequency = linspace(-0.5, 0.5, numel(P4));
plot(frequency, 10*log10(abs(P4)));
xlabel('Normalized frequency (\omega_0)');
ylabel('Power/frequency (dB)');
grid on;