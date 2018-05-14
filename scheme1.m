function [ h ] = scheme1(fpcimg, beta)
%SCHEME1 Generate Hash according to scheme 1
%   For a more detailed explanation look elsewhere...

[rho_length, theta_length] = size(fpcimg);  % get the size of the FFT in PC
K = 360;  % set K to 360
h=zeros(rho_length,1);  % initialise hash vector

for j=1:1:rho_length
    for i=1:round(K/theta_length):K
        h(j) = h(j) + beta(i,j)  * abs(fpcimg(j,i));
    end;
end;

end