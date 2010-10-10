#!/usr/bin/octave3.2
% Depends on Octave 3.2 and the "image" package,
% available here: http://octave.sourceforge.net/image/overview.html

close all;

% open files in grayscale
% TODO: acquire cameraman.tif and tire.tif
lena = rgb2gray(imread('lena.tif'));
%cman = rgb2gray(imread('cameraman.tif'));

% resize images by factor of 4 using bilinear interpolation
l_small = imresize(lena, 1/4, 'linear');
%c_small = imresize(cman, 1/4, 'linear');

% plot down-sampled images
figure; imshow(l_small); title('Lena (downsampled)');
%figure; imshow(c_small); title('Cameraman (downsampled)');

% perform digital zooming using NN, bilinear, and bicubic interpolations;
% be sure to turn off the antialiasing filter
l_nn = imresize(l_small, 4, 'nearest', 0);
l_bilin = imresize(l_small, 4, 'linear', 0);
l_bicub = imresize(l_small, 4, 'cubic', 0);
%c_nn = imresize(c_small, 4, 'nearest', 0);
%c_bilin = imresize(c_small, 4, 'linear', 0);
%c_bicub = imresize(c_small, 4, 'cubic', 0);

% plot up-sampled images
figure; imshow(l_nn); title('Nearest Neighbour');
figure; imshow(l_bilin); title('Bilinear');
figure; imshow(l_bicub); title('Bicubic');
%figure; imshow(c_nn); title('Nearest Neighbour');
%figure; imshow(c_bilin); title('Bilinear');
%figure; imshow(c_bicub); title('Bicubic');

% compute PSNR between original images and each corresponding up-sampled
% image, and display the calculated values
psnr_l_nn = PSNR(lena, l_nn)
psnr_l_bilin = PSNR(lena, l_bilin)
psnr_l_bicub = PSNR(lena, l_bicub)
%psnr_c_nn = PSNR(cman, c_nn)
%psnr_c_bilin = PSNR(cman, c_bilin)
%psnr_c_bicub = PSNR(cman, c_bicub)
