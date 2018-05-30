function [ h ] = vlad_schema1( fpcimg, beta, K)
%VLAD_SCHEMA1 Summary of this function goes here
%   Implementation for schema 1 on feature generation step -- no beta use for
%   this times

    % get the size of the FFT in PC
    [rho_length, theta_length] = size(fpcimg);
    
    h=zeros(K/2, 1);  %initialise hash vector
    
    for i=1:1:K/2
        for j=1:rho_length
            h(i) = h(i) + abs(fpcimg(j, i*2));
        end;
    end;

end

