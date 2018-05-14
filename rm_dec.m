function [decoded_hash] = rm_dec(gray_hash)
%RM_DEC Reed Muller Decoding
%   Vlad's way
    m = 7;
    n = 17;
    k = 15;
    
    gfGrayCode = gf(gray_hash, m); 
    decoded_hash = rsdec(gfGrayCode, n, k);   

end

