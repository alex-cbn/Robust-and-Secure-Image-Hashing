function [ fx, fy ] = in2n( i, j, N )
%IN2N Converts an indexed pair to normalised values between 0 and 1

fx = double(i / N);
fy = double(j / N);

end

