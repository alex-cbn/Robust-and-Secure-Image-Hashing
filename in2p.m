function [ rho, theta ] = in2p( i, j, N )
%IN2P Converts a pair of indexes to polar coordinates
%   It uses 2 primitves in2n and n2p and N is the length of the matrix

[fx, fy] = in2n(i,j,N);
[rho, theta] = n2p(fx, fy);

end

