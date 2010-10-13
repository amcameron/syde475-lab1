#!/usr/bin/octave3.2
% Depends on Octave 3.2 and the "image" package,
% available here: http://octave.sourceforge.net/image/overview.html

close all;

tire_img = imread('tire.tif');

% imhist doesn't work in octave without this
tire_img = im2double(tire_img);
imwrite(tire_img, 'files/tire_orig.png');

figure; imshow(tire_img); title('Tire');
figure; imhist(tire_img);
% PDF is the desired format, but Octave doesn't set the size properly in its
% PDF output. Also, this is output before the title is set, so that the
% histogram can be captioned in LaTeX.
print('files/tire_orig_hist.eps', '-depsc2');
title('Histogram of Tire');

% ensure different timestamps between images, for easier browsing
pause(1);

tire_img_negative = imcomplement(tire_img);
imwrite(tire_img_negative, 'files/tire_negative.png');
figure; imshow(tire_img_negative); title('Tire (negative transform)');
figure; imhist(tire_img_negative);
print('files/tire_negative_hist.eps', '-depsc2');
title('Histogram of Tire (negative transform)');

pause(1);

tire_img_gamma_13 = tire_img .^ 1.3;
imwrite(tire_img_gamma_13, 'files/tire_gamma_1.3.png');
figure; imshow(tire_img_gamma_13); title('Tire (Gamma correction of 1.3)');
figure; imhist(tire_img_gamma_13);
print('files/tire_gamma_1.3_hist.eps', '-depsc2');
title('Histogram of Tire (Gamma correction of 1.3)');

pause(1);

tire_img_gamma_5 = tire_img .^ 0.5;
imwrite(tire_img_gamma_5, 'files/tire_gamma_0.5.png');
figure; imshow(tire_img_gamma_5); title('Tire (Gamma correction of 0.5)');
figure; imhist(tire_img_gamma_5);
print('files/tire_gamma_0.5_hist.eps', '-depsc2');
title('Histogram of Tire (Gamma correction of 0.5)');

pause(1);

% histeq plots the CDF for some reason, so we suppress this
figure; tire_img_histeq_256 = histeq(tire_img, 256); close;
imwrite(tire_img_histeq_256, 'files/tire_histeq_256.png');
figure; imshow(tire_img_histeq_256); title('Tire (Histogram equalization)');
figure; imhist(tire_img_histeq_256);
print('files/tire_histeq_256_hist.eps', '-depsc2');
title('Histogram of Tire (Histogram equalization)');

% Pause before terminating.
disp('Press any key to exit.');
pause
