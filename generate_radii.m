function [ radii ] = generate_radii(max_radius, number_of_radii, iteration)
%GENERATE_RADII Generate random radii off random bytes
%   Outputs prng values seeded by max_radius + number_of_radii
rng(max_radius + number_of_radii + iteration);
radii = rand(1, number_of_radii);
radii = radii .* (max_radius - 1);
radii = round(radii) + 1;
end