function [ output_image ] = downsample_image( varargin )
%Downsamples a image
%   the order of downsampling is a fraction and  can be specified or it
%   defaults to 0.25

order = 0.25;
if length(varargin)>1
    order = varargin{2};
end;  

%filtering image
output_image = imresize(varargin{1}, order);

end

