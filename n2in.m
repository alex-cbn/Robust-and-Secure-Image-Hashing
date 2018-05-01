function [ i, j ] = n2in(fx, fy, N)
%N2IN Converts a value between 0,1 to an index in an array of length N
i= uint32(floor(fx*N));
j= uint32(floor(fy*N));
end