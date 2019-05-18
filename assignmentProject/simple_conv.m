function [ y ] = simple_conv( x, h )
% simple implementation of the convolution of two vectors

Nx = length( x );
Nh = length( h );

% size of the output
y = zeros( 1, Nx + Nh - 1 );

% calculate filter output y for every value of n
for n = 1 : Nx + Nh - 1
    % convolution sum for current value of n
    y( n ) = 0;
    for k = 1 : Nx
        if( n - k + 1 > 0 ) && ( n - k + 1 <= Nh )
            y( n ) = y( n ) + x( k ) * h( n - k + 1 );
        end
    end  
end

end

