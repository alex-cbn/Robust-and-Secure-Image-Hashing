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
    im_doubleFormat = im2double(im_eqh);
    im_fft = fft2(im_doubleFormat);  
    im_fft = fftshift(im_fft);

    %convert to polar co-ordinates
    pcimg = imgpolarcoord(im_doubleFormat);
    fpcimg = imgpolarcoord(im_fft);

end

