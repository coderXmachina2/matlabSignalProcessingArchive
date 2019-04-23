%This is a script that takes in arguments and returns a sine wave. Called
%from another script.

function [x,t] = funcCreateSinWave(amplitude, frequency, phi, fs, L)

t = 0: 1/fs: L;
x = (amplitude)*sin( 2*pi*frequency*t + phi );

end


