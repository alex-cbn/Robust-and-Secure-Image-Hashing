function [ h ] = scheme2(fpcimg, beta, features_count, radii_count, K)
%SCHEME2 Generate Hash according to scheme 2
%For a more detailed explanation look elsewhere...

[rho_length, theta_length] = size(fpcimg);  % get the size of the FFT in PC
h=zeros(features_count,1);  % initialise features vector


for j=1:1:features_count  % iterate for each feature in hash
    % create a set of radii based off beta
    radii=generate_radii(rho_length, radii_count, beta(1,j));
    for radius=1:1:radii_count  % iterate over each radii
        temp = 0;
        for i=1:round(K/theta_length):K  % sum along theta axis
            temp = temp + abs(fpcimg(radii(radius),i));
        end;
        temp = beta(radius,1) * temp;  % weight per radii sum by a random byte
        h(j) = h(j) + temp;  % add the partial result to the current feature
    end;

end;

end

