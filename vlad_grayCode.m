function [ h_bin_grayCode ] = vlad_grayCode( h, precision )
%VLAD_GRAYCODE Summary of this function goes here
%   generate grayCode of a Quantized Feture Vector

    grayCode = bin2gray(h, 'qam', 2^precision);
    
    %h_bin_grayCode = dec2bin(grayCode);
    h_bin_grayCode = grayCode;
    
end
