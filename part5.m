#!/usr/bin/octave3.2
% Depends on Octave 3.2 and the "image" package,
% available here: http://octave.sourceforge.net/image/overview.html

close all;

% Create test image and Fourier transform; plot them.
f = zeros(256);
f(:, 108:148) = 1;
F = fftshift(fft2(f));
figure; imshow(f);
figure; imshow(abs(F), []);

% Rotate image; plot it and its Fourier transform.
frot = imrotate(f, 45, 'nearest', 'crop', 0);
Frot = fftshift(fft2(frot));
figure; imshow(frot);
figure; imshow(abs(Frot), []);

% Open lena.tif and find both components of its Fourier transform.
lena = rgb2gray(imread('lena.tif'));
Flena = fft2(lena);
Flena_mag = abs(Flena);
Flena_phs = angle(Flena);

% Perform inverse Fourier transforms on the magnitude and phase separately.
% TODO: why are these abs() calls necessary?
lena_mag = abs(ifft2(Flena_mag));
lena_phs = abs(ifft2(Flena_phs));
figure; imshow(lena);
figure; imshow(lena_mag);
figure; imshow(lena_phs);

% Pause before terminating.
disp("Press any key to exit.");
pause
