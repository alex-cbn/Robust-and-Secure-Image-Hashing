%=================================================================
%gf2dec.m
%Convert a Galois Field Array into a Decimal Array.
%The calling syntax is:
%		[DecOutput] = gf2dec(GFInput,m,prim_poly)
%Inputs:
%   GFInput: gf Array input
%   m: integer between 1 and 16 used in GF(2^m) array
%   prim_poly: integer representation of the primitive polynomial used by GF
%Outputs:
%   DecOutput: Decimal Array 
%=================================================================

function [DecOutput] = gf2dec(GFInput,m,prim_poly)
GFInput = GFInput(:)';% force a row vector
GFRefArray = gf([0:(2^m)-1],m,prim_poly);
DecOutput = zeros(length(GFInput), 1);

for i=1:length(GFInput)
    for k=0:(2^m)-1
        temp = isequal(GFInput(i),GFRefArray(k+1));
        if (temp==1)
            DecOutput(i) = k;
            break;
        end
    end
end