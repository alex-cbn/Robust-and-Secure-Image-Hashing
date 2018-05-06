function [ d ] = hammingdistance( hash1, hash2 )
%HAMMINGDISTANCE Calculates the normalised Hamming distance in respect to
%the length 
L1 = length(hash1);
L2 = length(hash2);
if  L1~=L2
    print('The lengths of the hashes do not match');
    d = -1;
else
    L=L1;
    for k=1:1:L
        d = d + abs(hash1(k)-hash2(k));
    end;
    d = 1/L * d;
end;

end

