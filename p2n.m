function [ fx, fy ] = p2n( rho, theta)
%P2N Converts from polar coordinates to a "normalised" value

fx = rho * cos(theta);
fy = rho * sin(theta);

end

