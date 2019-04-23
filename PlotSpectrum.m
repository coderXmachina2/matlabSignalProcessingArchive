function [XdB, f] = PlotSpectrum(x, fs)

N = length(x);

if N/2 ~= floor(N/2)
    N = N - 1;
    x = x(1:end-1);
end

f = (0:(floor(N/2)-1))/N*fs;

X = fft(x);
X = X(1:N/2);
X = X/max(abs(X));
XdB = mag2db(abs(X));
%f and Xdb are the return variables





