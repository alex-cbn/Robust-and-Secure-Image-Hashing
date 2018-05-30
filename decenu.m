f = imread('lena_gray.bmp');
F = fft2(f,2048,2048);
F = fftshift(F);
F2 = log(abs(F));
imagesc(F2)
colormap(jet); colorbar