function [h_p] = postprocess(h)
%POSTPROCESS Applies postprocessing as described in section 3
%   
h_q = quant_norm(h, 16);  % quant+norm
h_g = gray_code(h_q);  % gray encode
h_d = rm_dec(h_g);  % Reed Muller decode
h_p = h_d;  % TODO: Key Based Permutation


end

