clear

%Signal 1 params:
universalSampler = 44100;
A = 3;
f = 1000;
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

[sdB1 f1] = PlotSpectrum(signal1, universalSampler);
[sdB2 f2] = PlotSpectrum(signal2, universalSampler);
[sumSpectra f3] = PlotSpectrum(sum, universalSampler);

%Combined sine wave
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
%individual plot
figure (3)
plot(f1,sdB1,'linewidth', 1)
grid
axis tight
xlabel('frequency (Hz)')
ylabel('amplitude (dB)')
title('spectrum 1 Signal Wave ')

figure (4)
plot(f2,sdB2,'linewidth', 1)
grid
axis tight
xlabel('frequency (Hz)')
ylabel('amplitude (dB)')
title('spectrum Signal Wave ')

%together plot
figure (5)
plot(f2,sdB1,'linewidth', 1)
hold on
plot(f1,sdB2,'linewidth', 1)
grid
axis tight
xlabel('frequency (Hz)')
ylabel('amplitude (dB)')
title('plot spectrum together')

figure (6)
plot(f3,sumSpectra,'linewidth', 1)
grid
axis tight
xlabel('frequency (Hz)')
ylabel('amplitude (dB)')
title('plot sumSpectra')
