#!/usr/bin/octave3.2
% Depends on Octave 3.2 and the "image" package,
% available here: http://octave.sourceforge.net/image/overview.html

close all;

tire_img = imread('tire.tif');

% imhist doesn't work in octave without this
tire_img = im2double(tire_img);

figure; imshow(tire_img); title('Tire');
figure; imhist(tire_img); title('Histogram of Tire');

tire_img_negative = imcomplement(tire_img);
figure; imshow(tire_img_negative); title('Tire (negative transform)');
figure; imhist(tire_img_negative); title('Histogram of Tire (negative transform)');

tire_img_gamma_13 = tire_img .^ 1.3;
figure; imshow(tire_img_gamma_13); title('Tire (Gamma correction of 1.3)');
figure; imhist(tire_img_gamma_13); title('Histogram of Tire (Gamma correction of 1.3)');

tire_img_gamma_5 = tire_img .^ 0.5;
figure; imshow(tire_img_gamma_5); title('Tire (Gamma correction of 0.5)');
figure; imhist(tire_img_gamma_5); title('Histogram of Tire (Gamma correction of 0.5)');

% histeq plots the CDF for some reason, so we suppress this
figure; tire_img_histeq_256 = histeq(tire_img, 256); close;
figure; imshow(tire_img_histeq_256); title('Tire (Histogram equalization)');
figure; imhist(tire_img_histeq_256); title('Histogram of Tire (Histogram equalization)');

% Pause before terminating.
disp('Press any key to exit.');
pause
