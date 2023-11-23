A = imread('lowContrastpng.png');
figure;imshow(A,[]);title('Low Contrast')
f = double(A);

L=256;
rmin = min(min(f));
rmax = max(max(f));
rmin
rmax

B = 255*(f-rmin) ./ (rmax-rmin);

figure; imshow(uint8(B));title('High Contrast');

figure;
scatter(double(A(:)),double(B(:)),'Marker','.');
xlabel('Pixel intensity in image A');
ylabel('Pixel intensity in image B');
title('Pixel Intensity Comparison');

xlim([0,255]);
ylim([0,255]);