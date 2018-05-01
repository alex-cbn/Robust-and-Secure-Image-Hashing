function [ i, j ] = p2in( rho, theta, N )
%P2IN Converts a pair of polar coordinates to indexes in a matrix of len N
% It utilises 2 primitves p2n and n2in

[fx, fy] = p2n(rho, theta);
[i, j] = n2in(fx, fy, N);

end

