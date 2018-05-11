close all;
clc;
clear;

i=imread('img1_test.png');
j=imread('img3_test.png');

i=rgb2gray(i);
j=rgb2gray(j);


[h1_1, h2_1] = tupeu(i);
[h1_2, h2_2] = tupeu(j);

rez1=hammingdistance(h1_1,h1_2);
rez2=hammingdistance(h2_1,h2_2);