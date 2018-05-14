function [output_image] = apply_low_pass( varargin )
%Applies a lowpass filter on an image
%   the order of the filter can be specified or it defaults to 10

order = 10;
if length(varargin)>1
    order = varargin{2};
end;  

%creating filter
filter = fspecial('disk', order);
%filtering image
output_image = imfilter(varargin{1}, filter, 'replicate');

end

