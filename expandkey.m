function [ expanded_key ] = expandkey( key,  desired_length)
%EXPANDKEY Expands the key to the desired length by repeating it over and
%over
%   Vernam approves this PBKD scheme

    L = length(key);
    expanded_key=zeros(desired_length, 1);
    for i=1:1:desired_length
        expanded_key(i)=key(mod(i, L)+1);
    end;

end

