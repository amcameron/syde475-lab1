#!/usr/bin/octave3.2

close all;

lena_img = imread('lena.tif');
lena_img = rgb2gray(lena_img);
max(max(lena_img))
% normalize lena_img to be in the range [0, 1]
lena_img = double(lena_img)/255;

% impulse functions from the lab1 handout
h1 = (1/6)*ones(1,6);
h2 = h1';
h3 = [-1 1];

lena_conv_h1 = conv2(lena_img, h1);
lena_conv_h2 = conv2(lena_img, h2);
lena_conv_h3 = conv2(lena_img, h3);

figure; imshow(lena_img); title('Lena');
figure; imshow(lena_conv_h1); title('Lena convolved with a horizontal 6x1/6 box');
figure; imshow(lena_conv_h2); title('Lena convolved with a vertical 6x1/6 box');
figure; imshow(lena_conv_h3); title('Lena convolved with [-1 1]');

% observing that convolution with h3 puts the image in the range [-1, 1], scale
% and translate the values back into the range [0, 1]
lena_conv_h3_moved = lena_conv_h3 ./ 2 .+ .5;
figure; imshow(lena_conv_h3_moved); title('Lena convolved with [-1 1], moved into range [0, 1]');

% observing that convolution with h3 puts the image in the range [-1, 1], take
% the absolute value to put all values back into the range [0, 1]
lena_conv_h3_abs = abs(lena_conv_h3);
figure; imshow(lena_conv_h3_abs); title('Lena convolved with [-1 1], absolute value');

% Pause before terminating.
disp("Press any key to exit.");
pause
