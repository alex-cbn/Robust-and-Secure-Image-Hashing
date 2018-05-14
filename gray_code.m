function [ gcode ] = gray_code(q_hash)
%GRAY_CODE Computes gray code for a given hash
%   Vlad's way

h_bin = dec2bin(q_hash);
gcode = bin2gray(h_bin, 'fsk', 64);

end

