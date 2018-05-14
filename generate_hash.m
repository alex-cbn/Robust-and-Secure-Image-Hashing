function [ h1, h2 ] = generate_hash( i )
%TUPEU Summary of this function goes here
%   Detailed explanation goes here

if size(i,3) == 3
    i = rgb2gray(i);
end

%[width, height, depth] = size(i);

%PREPROCESSING
    %LOW PASS FILTERING
    i = apply_low_pass(i);
    %DOWNSAMPLING
    i = downsample_image(i);
    %EQUALISE HISTOGRAM
    i = histeq(i);
    %FFT2 the preprocessed image
    I = fft2(i);

%SWITCH TO POLAR
    im = double(I);

    fim=fft2(im);
    fim = fftshift(fim);
    fpcimg=imgpolarcoord(fim);

%FEATURES GENERATION

%%%%%%%%%KEY_TO_PSEUDORAND_BYTES
    K=360;
    beta = ones(K,K);

    %Scheme 1
    h1 = scheme1(fpcimg, beta);
    %Scheme 2
    h2 = scheme2(fpcimg, beta);

%POSTPROCESSING
    h1 = postprocess(h1);
    h2 = postprocess(h2);
    
end

