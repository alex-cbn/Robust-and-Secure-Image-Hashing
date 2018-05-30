close all;
clc;
clear;
%load configuration
config;
%read images
i=imread('img3_test.PNG');
j=imread('lena_gray.bmp');
%compute hashes
[h1_1, h2_1] = generate_hash(i, 'asdf1234', features_count, radii_count, K, quantization_factor);
[h1_2, h2_2] = generate_hash(j, 'asdf1234', features_count, radii_count, K, quantization_factor);
%compare the 2
rez1=hammingdistance(h1_1,h1_2);
rez2=hammingdistance(h2_1,h2_2);