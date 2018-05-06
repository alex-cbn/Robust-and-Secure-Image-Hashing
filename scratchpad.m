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

%SWITCH TO POLAR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
im = double(i);

fim=fft2(im);
fim = fftshift(fim);
pcimg=imgpolarcoord(im);
fpcimg=imgpolarcoord(fim); % functie bomba de pe net. suporta la parametrii <K> ala din articol si by default il ia 360
%dar nu baga interpolare deci... whatever. practic face ce ar trebui noi sa
%facem doar ca nu stiu(stim?) adica pleaca din centrul imaginii si
%desfasoara imaginea ca intr-o spirala si o imparte in radii (aparent pluarul de la radius)
%pe exemplul nostru de imagine 64x64 evident scoate un 32(fiecare nivel de
%rho) cu 360(fiecare theta). One little problem eu as vedea ca in fiecare
%valoare din noua matrice sa gasesc daca fac cart2pol acelasi rho de 360 de
%ori si un alt theta de la 0 la 360 (-pi, pi), realitatea e un pic departe
%this needs further investigation...though maybe we'll crack it up

%posibila explicatie pentru variatie e din cauza lui round si faptul ca
%defapt avem o imagine gen patrata si o dam in cerc


[roz,fi] = cart2pol(real(fpcimg), imag(fpcimg));


figure; subplot(2,2,1); imagesc(im); colormap gray; axis image;
title('Input image');  subplot(2,2,2);
imagesc(log(abs(fftshift(fim)+1)));  colormap gray; axis image;
title('FFT');subplot(2,2,3); imagesc(pcimg); colormap gray; axis image;
title('Polar Input image');  subplot(2,2,4);
imagesc(log(abs(fpcimg)+1));  colormap gray; axis image;
title('Polar FFT');



%FEATURES GENERATION

%%%%%%%%%KEY_TO_PSEUDORAND_BYTES
K=360;
beta = ones(K,K);

[rho_length, theta_length] = size(fpcimg);

h=zeros(rho_length,1);
%Scheme 1
for j=1:1:rho_length
    for i=1:1:K % maybe something like round(K/theta_length)
        h(j) = h(j) + beta(i,j)  * abs(fpcimg(j,i));
    end;
end;

%Scheme 2
%generate radii out of secret key... GL with that
radii=1:1:rho_length;

for radius=1:1:size(radii);
    for i=1:1:K % maybe something like round(K/theta_length)
        h(radius) = h(radius) + beta(radius) * abs(fpcimg(radius,i));
    end;
end;