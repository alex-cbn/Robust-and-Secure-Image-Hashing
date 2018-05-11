function [ radii ] = generate_radii(max_radius, number_of_radii)
%GENERATE_RADII Generate random radii off random bytes
%   Outputs prng values seeded by max_radius + number_of_radii
rng(max_radius+number_of_radii);
radii = rand(1,number_of_radii);
radii = radii .* max_radius;
radii = round(radii);
end