function [ decoded ] = vlad_reedMullerDec( h_bin_grayCode )
%VLAD_REEDMULLERDEC Summary of this function goes here
%   Decode binary hash sequence resulted from grayCode
    
    m = 7;
    n = 17;
    k = 15;
    
    gfGrayCode = gf(h_bin_grayCode, m); 
    decoded = rsdec(gfGrayCode, n, k);   
end

