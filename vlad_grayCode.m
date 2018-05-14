function [ grayCode ] = vlad_grayCode( imgName )
%VLAD_GRAYCODE Summary of this function goes here
%   code the norm vector(16) into gray code

    i = imread(imgName);
    [h, h2] = generate_hash(i);

    h_quant = quant_norm(h, 16);
    h_bin = dec2bin(h_quant);
    
    grayCode = bin2gray(h_bin, 'fsk', 64);

end

