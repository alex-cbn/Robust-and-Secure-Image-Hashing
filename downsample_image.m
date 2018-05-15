function [ output_image ] = downsample_image( varargin )
%Downsamples a image
%   the order of downsampling is a fraction and  can be specified or it
%   defaults to 256x256

x=256;
y=256;

if length(varargin)==3
    x = varargin{2};
    y = varargin{3};
end;  

%filtering image
output_image = imresize(varargin{1}, [x y]);
end

