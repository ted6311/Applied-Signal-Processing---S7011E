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