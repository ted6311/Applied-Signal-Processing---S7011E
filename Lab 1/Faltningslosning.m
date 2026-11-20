
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
n = 24; % Val av realisering för test på en av dem
my_realization = X(:,n);

%% Baseline periodogram
[rb,~] = my_acs(my_realization);
Pt = fft(rb);
% figure()
% plot(k, 10*log10(abs(P)));
% title('Baseline periodogram')
% xlabel('lag');
% ylabel('Power/frequency (dB)');
% grid on;

%% Bartlett window scaled periodogram estimation
P1t = my_periodogram(my_realization,'bartlett');
% Plot the estimated power spectral density
% figure()
% plot(k, 10*log10(abs(P1)));
% title('Bartlett window periodogram')
% xlabel('lag');
% ylabel('Power/frequency (dB)');
% grid on;

%% Hanning
P2t = my_periodogram(my_realization,'hanning');
% figure()
% plot(k, 10*log10(abs(P2)));
% title('Hanning window periodogram');
% xlabel('lag');
% ylabel('Power/frequency (dB)');
% grid on;

%% Hamming
P3t = my_periodogram(my_realization,'hamming');
% figure()
% plot(k, 10*log10(abs(P3)));
% title('Hamming window periodogram');
% xlabel('lag');
% ylabel('Power/frequency (dB)');
% grid on;

%% Blackman
P4t = my_periodogram(my_realization,'blackman');
% figure()
% plot(k, 10*log10(abs(P4)));
% title('Blackman window periodogram');
% xlabel('lag');
% ylabel('Power/frequency (dB)');
% grid on;

%% Comparison plot
figure;
plot(k, 10*log10(abs([Pt, P1t, P2t, P3t, P4t])));
title('Comparison between all windows for realization:',+n)
legend('Baseline','Bartlett','Hanning','Hamming','Blackman');
xlabel('Lag');
ylabel('Power/frequency (dB)');
grid on;

%% Averaging for all realizations

for i = 1:length(X(1,:))
    realization = X(:,i);
    [rtemp,~] = my_acs(realization);
    P(:,i) = fft(rtemp);
    P1(:,i) = my_periodogram(realization,'bartlett');
    P2(:,i) = my_periodogram(realization,'hanning');
    P3(:,i) = my_periodogram(realization,'hamming');
    P4(:,i) = my_periodogram(realization,'blackman');
    clear rtemp
end
meanP = mean(P,2);
meanP1 = mean(P1, 2);
meanP2 = mean(P2, 2);
meanP3 = mean(P3, 2);
meanP4 = mean(P4, 2);

%% Compare averaged periodogram estimates
figure;
plot(k, 10*log10(abs([meanP, meanP1, meanP2, meanP3, meanP4])));
title('Periodograms of the sequences using different windows')
legend('Square', 'Bartlett','Hanning','Hamming','Blackman');
xlabel('lag');
ylabel('Power/frequency (dB)');
grid on;

%% convultuon

Pb = fft(r);
Pbartlett = 1/2/pi*conv(Pb,fft(bartlett(length(X(:,1))))); % Faltning i frekvensdomänen, dock problem med att skiten blir större
Phanning = 1/2/pi*conv(Pb,fft(hanning(length(X(:,1)))));
Phamming = 1/2/pi*conv(Pb,fft(hamming(length(X(:,1)))));
Pblackman = 1/2/pi*conv(Pb,fft(blackman(length(X(:,1)))));


% Möjligt att man behöver
% plotta så här, då det blir en väldigt synlig cutoff vid 2000:e värdet.

plot(k, 10*log10(abs([Pb,Pbartlett(1:length(Pb)), Phanning(1:length(Pb)), ...
    Phamming(1:length(Pb)), Pblackman(1:length(Pb))])));
legend('Baseline','Bartlett','Hanning','Hamming','Blackman');
xlabel('Lag');
ylabel('Power/frequency (dB)');



%% Yule - Walker method
% Estimate AR coefficients and innovation variance using Yule-Walker
arOrder = 4;
[arCoefficients, noiseVariance] = aryule(X(:,1), arOrder); % Built in yule walker AR function :)



%% Yule - Walker method
% Estimate AR coefficients and innovation variance using Yule-Walker
arOrder = 4;
[arCoefficients, noiseVariance] = aryule(X(:,1), arOrder); % Built in yule walker AR function :)
% Estimate and plot the AR(4) power spectral density
[arSpectrum, frequency] = freqz(sqrt(noiseVariance), ...
    [1, arCoefficients], 1024, 'whole');
figure;
plot(frequency, 10*log10(abs(arSpectrum).^2));
title('AR(4) Power Spectral Density using Yule-Walker');
xlabel('Normalized frequency');
ylabel('Power/frequency (dB)');
grid on;



orders = [2,4,8,12]; 
figure;
hold on;
title('Yule-Walker spectrum estimates for different model orders');
xlabel('Normalized frequency');
ylabel('Power/frequency (dB)');
grid on;

for i = 1:length(orders)
    [arCoefficients, noiseVariance] = aryule(X(:,1), orders(i));
    [arSpectrum, frequency] = freqz(sqrt(noiseVariance), ...
        [1, arCoefficients], 1024, 'whole');
    plot(frequency, 10*log10(abs(arSpectrum).^2), ...
        'DisplayName', ['AR(', num2str(orders(i)), ')']);
end

legend show;