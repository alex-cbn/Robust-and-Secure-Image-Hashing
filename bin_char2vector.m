function [ bit_vector ] = bin_char2vector(chars)
%BIN_CHAR2VECTOR Converts bits outputed as chars to a vector o bits
%

charolina = chars;
charolina = charolina - '0';
bit_vector = uint8(charolina);

end

