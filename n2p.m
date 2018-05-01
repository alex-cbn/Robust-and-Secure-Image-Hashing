function [ rho, theta ] = n2p( fx, fy )
%N2P Converts a value to polar coordinates

theta = atan(fy/fx);
rho = fx/cos(theta);

end

