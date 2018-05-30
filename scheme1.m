function [ h ] = scheme1(fpcimg, beta, features_count, K)
%SCHEME1 Generate Hash according to scheme 1
%For a more detailed explanation look elsewhere...

[rho_length, theta_length] = size(fpcimg);  % get the size of the FFT in PC
h=zeros(features_count,1);  % initialise features vector

%generate random radii to be chosen to sum along
random_rhos = generate_radii(rho_length, features_count, beta(1,1));

for j=1:1:features_count  % iterate over each feature
    for i=1:round(K/theta_length):K  % sum each theta the FFT value weighted by a rand byte
        h(j) = h(j) + beta(random_rhos(j), i) * abs(fpcimg(random_rhos(j),i));
    end;
end;

end