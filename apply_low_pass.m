function [output_image] = apply_low_pass( varargin )
%Applies a lowpass filter on an image
%   the order of the filter can be specified or it defaults to 10

%Apply gaussian filter
output_image = imgaussfilt(varargin{1}, 0.6);

end

