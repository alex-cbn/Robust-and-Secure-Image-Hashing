function [ h ] = vlad_schema1( fpcimg, beta )
%VLAD_SCHEMA1 Summary of this function goes here
%   Generate schema 1 

%     %[rho_length, ~] = size(fpcimg);
%     K = 360; %doc says
%     %h=zeros(rho_length, 1);  % initialise hash vector
%     h=zeros(16, 1);
% 
%     for j = 1:16    %index for rho || how many characteristics
%         for i = 1:K         %travel all 360deg
%             absPCI = abs(fpcimg(j*8, i));
%             h(j) = h(j) + beta(j*8,i) * absPCI;
%         end;
%     end;
    [rho_length, theta_length] = size(fpcimg);  % get the size of the FFT in PC
    K = 360;  % set K to 360
    h=zeros(rho_length,1);  % initialise hash vector

    for j=1:1:16
        for i=1:round(K/theta_length):K
            h(j) = h(j*8) + abs(fpcimg(j*8,i));
        end;
    end;

end

