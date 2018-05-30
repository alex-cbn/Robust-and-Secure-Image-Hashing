function [ D ] = vlad_hamming( h1, h2, precision )
%VLAD_HAMMING Summary of this function goes here
%   Detailed explanation goes here

    [r, ~] = size(h1);
    D = 0;
    
    for i=1:r
        max_a = max(h1(i), h2(i));
        toAdd = 2*max_a - h1(i) - h2(i);
        D = D + toAdd;
    end
    
    D = double(D);
    D = D / r;
    D = D / (2^precision);

end

