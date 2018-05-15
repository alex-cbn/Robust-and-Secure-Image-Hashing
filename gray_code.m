function [ gcode ] = gray_code(q_hash)
%GRAY_CODE Computes gray code for a given hash
%   Vlad's way

h_bin = dec2bin(q_hash);
gcode = bin_char2vector(h_bin);
%gcode = bin2gray(h_bin, 'fsk', 64); WATCH OUT

end

