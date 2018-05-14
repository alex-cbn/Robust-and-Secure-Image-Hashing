function [ pcI] = preprocess(i)
%PREPROCESS Preprocesses the image
%   Low pass, downsampling, equalize histogram, fft2, fft2polar
%LOW PASS FILTERING
    i = apply_low_pass(i);
    %DOWNSAMPLING
    i = downsample_image(i);
    %EQUALISE HISTOGRAM
    i = histeq(i);
    %FFT2 the preprocessed image
    I = fft2(i);

%SWITCH TO POLAR
    %I = double(I); % questionable
    I = fftshift(I);
    pcI=imgpolarcoord(I);

end

