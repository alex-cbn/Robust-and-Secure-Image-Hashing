%Default
clear;
clc;
close all;

%read image and its attributes
i = imread('lena_gray.bmp');
[width, height, depth] = size(i);

%PREPROCESSING

%LOW PASS FILTERING
i = apply_low_pass(i);
%DOWNSAMPLING
i = downsample_image(i);
%EQUALISE HISTOGRAM
i = histeq(i);
%FFT2 the preprocessed image
I = fft2(i);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
im = double(i);

fim=fft2(im);
fim = fftshift(fim);
pcimg=imgpolarcoord(im);
fpcimg=imgpolarcoord(fim);
figure; subplot(2,2,1); imagesc(im); colormap gray; axis image;
title('Input image');  subplot(2,2,2);
imagesc(log(abs(fftshift(fim)+1)));  colormap gray; axis image;
title('FFT');subplot(2,2,3); imagesc(pcimg); colormap gray; axis image;
title('Polar Input image');  subplot(2,2,4);
imagesc(log(abs(fpcimg)+1));  colormap gray; axis image;
title('Polar FFT');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Switch to polar coordinates
[ftw,fth] = size(I);
column_matrix = I(:);

[d_i, d_j] = p2in(2/64, 0.56,ftw);

% for i=1:1:ftw
%     for j=1:1:fth
%         
%     end;
% end;
% 
% theta_s = reshape(theta, [ftw, fth]);
% rho_s = reshape(rho, [ftw, fth]);

% % let's see the results
% 
% figure;
% polarplot(theta_s, rho_s); colormap(gray);
% 
% figure;
% imagesc(100*log(1+abs(fftshift(I)))); colormap(gray); 
% title('magnitude spectrum');

%FEATURES GENERATION

%%%%%%%%%KEY_TO_PSEUDORAND_BYTES
K=360;
beta = ones(K,K);
hp=zeros(K,1);
%Scheme 1
for j=1:1:K
    for i=0:1:(K-1)
        hp(j) = hp(j) + beta(i+1,j)  * abs(0);
    end;
end;