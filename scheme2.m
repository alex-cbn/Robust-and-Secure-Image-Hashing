function [ h ] = scheme2(fpcimg, beta)
%SCHEME2 Generate Hash according to scheme 2
%    For a more detailed explanation look elsewhere...

[rho_length, theta_length] = size(fpcimg);  % get the size of the FFT in PC
K = 360;  % set K to 360
h=zeros(rho_length,1);  % initialise hash vector

%generate the random number of radii per iteration
radii_count_per_iter = generate_radii( beta(1,1), rho_length); % key depdt


for j=1:1:rho_length
    % create a set of radii based off beta
    radii=generate_radii(rho_length, radii_count_per_iter(j));
    radii_l = length(radii);
    for radius=1:1:radii_l
        temp = 0;
        for i=1:round(K/theta_length):K
            temp = temp + abs(fpcimg(radii(radius),i));
        end;
        temp = beta(radius,1) * temp;
        h(j) = h(j) + temp;
    end;

end;

end

