% ***********************************
% ENSE807 Project 2019
% Supervisor: mstommel@aut.ac.nz

% ------------------------------------
% Your Name:
% Student ID:
% ------------------------------------


% clean up the remainders of previous activities in Matlab
clear;
%close all;
format compact;

% load input sequence
x = dlmread( 'signal1.txt' );

% display input sequence
figure( 1 );
subplot( 2, 1, 1 );
plot( x );
xlabel( 'Time [samples]' );
ylabel( 'Amplitude' );
title( 'Input signal x in the time-domain' );

subplot( 2, 1, 2 );
plot( x( 1 : 100 ) );
xlabel( 'Time [samples]' );
ylabel( 'Amplitude' );
title( 'Start section of x' );

% create the impulse response of a Gaussian filter for smoothing

ws = 21; % window size
sigma = 5;

m = linspace( -ws / 2, ws / 2, ws );
h = exp(-m .^ 2 / (2 * sigma ^ 2));
h = h / sum( h ); % normalisation to achieve an integral of one

% display the impulse response
figure( 2 );
plot( h, 'o-' );
axis tight;
xlabel( 'Time [samples]' );
ylabel( 'Amplitude' );
title( 'Gaussian filter' );

% perform gaussian filtering in the time domain

tic; % start timer
y1 = simple_conv( x, h ); % perform convolution like in the lecture slides
t_conv = toc; % measure cpu time

% display filter result
figure( 3 );
subplot( 2, 1, 1 );
plot( y1 );
xlabel( 'Time [samples]' );
ylabel( 'Amplitude' );
title( 'Signal y1' );

subplot( 2, 1, 2 );
plot( y1( 1 : 100 ) );
xlabel( 'Time [samples]' );
ylabel( 'Amplitude' );
title( 'Start section of y1' );

% display cpu time required for the convolution
disp( 'Time [s] conv:' );
disp( t_conv );

% perform the same filtering operation in the frequency domain

% further reading:
% https://www.sciencedirect.com/topics/engineering/convolution-property

N = length( x ) + length( h ) - 1;

% compute DFT of h
tic;
H = freqz( h, 1, N, 'whole' );  % w = 0 ... (N-1)*2pi/N
t_dft_h = toc;

% compute DFT of x
tic;
X = freqz( x, 1, N, 'whole' );
t_dft_x = toc;

% compute filter result Y in the frequency domain
tic;

% TODO: replace this line by a Matlab instruction


t_mul = toc;

% inverse transform
tic;
y2 = ifft( conj( Y' ) )';
t_idft = toc;

% display DFT of the impulse response
figure( 4 );
subplot( 2, 2, 1 );
plot( real( H ), imag( H ), '-' );
xlabel( 'Real' );
ylabel( 'Imag' );
title( 'DFT H(e^{j\omega})' );
axis equal;
grid on;
subplot( 2, 2, 2 );
plot( 0 : ( pi + pi ) / ( length( H ) - 1 ) : pi + pi, abs( H ), '-' );
axis tight;
xlabel( '\omega' );
ylabel( '|H(e^{j\omega})|' );
title( 'Magnitude' );
subplot( 2, 2, 3 );
plot( 0 : ( pi + pi ) / ( length( H ) - 1 ) : pi + pi, angle( H ), '-' );
title( 'Phase' );
xlabel( '\omega' );
ylabel( '\Theta(\omega)|' );
axis tight;

% display DFT of the input sequence
figure( 5 );
plot( real( X ), imag( X ), '-' );
axis equal;
title( 'DFT X(e^{j\omega})' );
xlabel( 'Real' );
ylabel( 'Imag' );

% display filter result
% (should be the same as in figure 3)
figure( 6 );
subplot( 2, 1, 1 );
plot( y2 );
xlabel( 'Time [samples' );
ylabel( 'Amplitude' );
title( 'Signal y2' );

subplot( 2, 1, 2 );
plot( y2( 1 : 100 ) );
xlabel( 'Time [samples' );
ylabel( 'Amplitude' );
title( 'Start section of y2' );

% display time
disp( 'Time [s] dft x:' );
disp( t_dft_x );
disp( 'Time [s] dft h:' );
disp( t_dft_h );
disp( 'Time [s] X times H:' );
disp( t_mul );
disp( 'Time [s] idft:' );
disp( t_idft );
disp( 'Total time [s] in frequency domain:' );
disp( t_dft_x + t_dft_h + t_mul + t_idft );


