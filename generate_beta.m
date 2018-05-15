function [ beta ] = generate_beta( key, rho_length, K )
%GENERATE_BETA Summary of this function goes here
%   Detailed generate beta (key-dependent pseudorandom numbers)

keyDouble = double(key);
index = 1;
keyLenght = size(keyDouble);
keyLenght = keyLenght(1,2);

beta = zeros(rho_length, K);

for i = 1 : rho_length
    for j = 1 : K
        beta(i,j) = mod(floor(rand()*128) + floor(keyDouble(index)), 128); 
        beta(i,j) = beta(i,j)/128;
        index = mod(index, keyLenght);
        index = index + 1;
    end
end

end

