function [ decoded ] = vlad_reedMullerDec( imgName )
%VLAD_REEDMULLERDEC Summary of this function goes here
%   Decode  binary hash sequence resulted from grayCode

    grayCode = vlad_grayCode(imgName);
    
    m = 7;
    n = 17;
    k = 15;
    
    gfGrayCode = gf(grayCode, m); 
    decoded = rsdec(gfGrayCode, n, k);   
end

