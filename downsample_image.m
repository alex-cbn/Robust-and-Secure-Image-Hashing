function [ output_image ] = downsample_image( img )
%Downsamples a image
%   make picture into correct format
%   defaults 256x256

%filtering image
output_image = imresize(img, [256 256]);

end

