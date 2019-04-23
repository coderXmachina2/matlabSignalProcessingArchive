clear

%Signal 1 params:
universalSampler = 44100;
A = 3;
f = 500;
phi = pi/4;
fs = universalSampler; 
L = 1;

%Signal 2 params
A2 = 3.5;
f2 = 10000;
phi2 = pi/4;
fs2 = universalSampler; 
L2 = 1;

%create 2 signals
[signal1, tIndex1] = funcCreateSinWave(A, f, phi, fs, L); 
[signal2, tIndex2] = funcCreateSinWave(A2, f2, phi2, fs2, L2); 

%sum them

sum = signal1 + signal2

[sdB1 f1] = PlotSpectrum(signal1, 44100);
[sdB2 f2] = PlotSpectrum(signal2, 44100);

%plot sine wave
figure(1)
plot(tIndex1, signal1)

hold on;

plot(tIndex2, signal2)
grid
axis tight
xlabel('time')
ylabel('Amplitude')
title('Sine Wave')

%plot their spectra
figure (3)
plot(f1,sdB1,'linewidth', 1)
grid
axis tight
xlabel('frequency (Hz)')
ylabel('amplitude (dB)')
title('spectrum Signal Wave ')

figure (4)
plot(f2,sdB2,'linewidth', 1)
grid
axis tight
xlabel('frequency (Hz)')
ylabel('amplitude (dB)')
title('spectrum Signal Wave ')

%{
period = round(fs/f);
pow = (1/period)*sum(abs(signal(1:period)).^2); 
 
N = length(signal) + 1;  % to be even :) 

S = fft(signal,N); 
SdB = 20*log10(S);  % or SdB = mag2db(S); 
freqs = (0:(N/2)-1)*fs/N;

%}

%plot spectrum
%figure(2)
%plot(freqs, SdB(1:N/2)) 
%xlabel('frequency')
%ylabel('amplitude')
%title('spectrum')