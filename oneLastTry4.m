%Final decision

%Input data
i_name1 = 'test3.png';
i_name2 = 'lena.png';
FFT_Prec = 1024;
K = 360;
precision = 9;


%Read images and convert to grayscale
i_1 = imread(i_name1);
i_2 = imread(i_name2);
if size(i_1,3) == 3
    i_1 = rgb2gray(i_1);
end
if size(i_2,3) == 3
    i_2 = rgb2gray(i_2);
end


%LOW PASS FILTERING
i_1 = apply_low_pass(i_1);
i_2 = apply_low_pass(i_2);


%DOWNSAMPLING
i_1 = downsample_image(i_1);
i_1 = double(i_1) / 255;
i_2 = downsample_image(i_2);
i_2 = double(i_2) / 255;


%EQUALISE HISTOGRAM
i_1 = histeq(i_1);
i_2 = histeq(i_2);


%FFT2 the preprocessed image
I_1 = fftshift(fft2(i_1, FFT_Prec, FFT_Prec));
I_2 = fftshift(fft2(i_2, FFT_Prec, FFT_Prec));


%Images in polar coordonates
I_1_PC = imgpolarcoord(I_1); I_1_PC = abs(I_1_PC);
min_I = min(I_1_PC(:)); I_1_PC = I_1_PC - min_I;
max_I = max(I_1_PC(:)); I_1_PC = I_1_PC / max_I;
I_2_PC = imgpolarcoord(I_2); I_2_PC = abs(I_2_PC);
min_I = min(I_2_PC(:)); I_2_PC = I_2_PC - min_I;
max_I = max(I_2_PC(:)); I_2_PC = I_2_PC / max_I;


%Extract feature for images
[rho_length, ~] = size(I_1_PC);
h1=zeros(rho_length, 1);
h2=zeros(rho_length, 1);
for j=1:1:rho_length
    for i=1:1:K
        h1(j) = h1(j) + I_1_PC(j, i);
        h2(j) = h2(j) + I_2_PC(j, i);
    end;
end;

min_h = min(h1); h1 = h1 - min_h; max_h = max(h1); h1 = h1 / max_h;
min_h = min(h2); h2 = h2 - min_h; max_h = max(h2); h2 = h2 / max_h;
h1 = floor(h1 * (2^precision - 1));
h2 = floor(h2 * (2^precision - 1));


%Gray code
h1_g = bin2gray(h1, 'fsk', 2^precision);
h2_g = bin2gray(h2, 'fsk', 2^precision);

%Hamming distance
[r, ~] = size(h1);
D = 0;
D_g = 0;

for i=1:r
    toAdd = abs(h1(i) - h2(i));
    D = D + toAdd;
    
    toAdd = abs(h1_g(i) - h2_g(i));
    D_g = D_g + toAdd;
end

D = D / r;
D_g = D_g / r;


clear max_h, clear min_h, clear max_I, clear min_I , clear i_name1, clear i_name2;
clear i, clear j, clear i_1, clear i_2;












