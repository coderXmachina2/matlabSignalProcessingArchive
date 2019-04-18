clf;

a = -80;
b = 80;

n = a:b; %sample length
fs = 0.0125; %sample frequency
phi = 0;
Amp = 6;

x = Amp*sin(2*pi*fs*n - phi);           %signal 1
x2 = -Amp*sin(2*pi*fs*n - (phi + 30));  %signal 2
x3 = -Amp*sin(2*pi*fs*n - (phi + 45));  %signal 3 blue

clf
stem(n, x, 'Color',[.70 .51 .201])
axis([0 b -2 2]);
grid;
title('sinusoid')
xlabel('Time index n')
ylabel('Amplitude')
axis

hold on

stem(n, x2, 'Color',[.10 .51 .240])
stem(n, x3, 'Color',[.10 .51 1]) %blue