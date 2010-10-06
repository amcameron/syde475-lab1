#!/usr/bin/octave3.2
% Depends on Octave 3.2 and the "image" package,
% available here: http://octave.sourceforge.net/image/overview.html

% open files
lena = rgb2gray(imread('lena.tif'));
%cman = rgb2gray(imread('cameraman.tif'));

% resize images by factor of 4 using bilinear interpolation
l_small = imresize(lena, 1/4, 'linear');
%c_small = imresize(cman, 1/4, 'linear');

% plot down-sampled images
figure
imshow(l_small);
%figure
%imshow(c_small);

% perform digital zooming using NN, bilinear, and bicubic interpolations
% TODO: this

% plot up-sampled images
% TODO: this

% compute PSNR between original images and each corresponding up-sampled
% image
% TODO: this
