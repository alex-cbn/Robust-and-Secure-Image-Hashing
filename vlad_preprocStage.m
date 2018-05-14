function [ im_lpf, im_ds, im_eqh, im_fft, pcimg, fpcimg ] = vlad_preprocStage( img_name )
%extragem infoarmtiile despre imagini si returnam aceste argumente

%read image and its attributes
i = imread(img_name);
if size(i,3) == 3
    i = rgb2gray(i);
end

%PREPROCESSING

%LOW PASS FILTERING
im_lpf = apply_low_pass(i);
%DOWNSAMPLING
im_ds = downsample_image(im_lpf);
%EQUALISE HISTOGRAM
im_eqh = histeq(im_ds);
%FFT2 the preprocessed image
im_fft = fft2(im_eqh);

%convert to polar co-ordinates
im_doubleFormat = double(im_eqh);
fim_doubleFormat=fft2(im_doubleFormat);
fim_doubleFormat = fftshift(fim_doubleFormat);  %fftshift

pcimg=imgpolarcoord(im_doubleFormat);
fpcimg=imgpolarcoord(fim_doubleFormat);

end

