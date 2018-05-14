function [beta] = get_rbytes(key, m, n)
%GET_RBYTES Gets some rand bytes out of a key
%   see readme for actual method or figure it out yourself... no drama
dkey = expandkey(key, m);
beta = zeros(m,n);
for i=1:1:m
    rng(dkey(i));
    beta(i, :) = rand(1,n);
    beta(i, :) = beta(i, :) .* 255;
    beta(i, :) = round(beta(i, :));
end;

end

