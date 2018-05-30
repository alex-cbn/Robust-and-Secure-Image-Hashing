function [ qnorm_vector ] = vlad_quantNorm( vector, precision )
%VLAD_QUANTNORM Summary of this function goes here
%   Quantize the vector in the with the specified precision

    max_value = max(vector);
    %min_value = min(vector);
    max_admit = 2^precision - 1;
    ratio_order = max_admit / max_value;
    
    qnorm_vector = floor(vector * ratio_order);
end

