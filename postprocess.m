function [h_p] = postprocess(h, quantization_factor)
%POSTPROCESS Applies postprocessing as described in section 3
%   
h_q = quant_norm(h, quantization_factor);  % quant+norm
h_g = gray_code(h_q);  % gray encode
h_p = h_g;  % TODO: Key Based Permutation
h_p = h_p(:);  % Convert matrix to vector

end

