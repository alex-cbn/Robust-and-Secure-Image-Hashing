function [ qnorm_vector ] = quant_norm(vector, precision)
%QUANT_NORM Normalises and quantifies values in a vector
%   gives an integer value between min and max 

max_value=max(vector);
min_value=min(vector);

value_range = 2^precision-1;
thickness= (max_value-min_value)/value_range;

qnorm_vector = vector - min_value;
qnorm_vector = round(qnorm_vector/thickness);

end

