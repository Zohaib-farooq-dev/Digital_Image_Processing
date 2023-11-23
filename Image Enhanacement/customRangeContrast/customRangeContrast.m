A = imread('lowContrastpng.png');
figure; imshow(A,[]);title('Original Image');
f = double(A);
rmin = min(min(f));
rmax = max(max(f));
rmax 
rmin 

smin = 20;
smax = 230;

B = ((((f - rmin)./(rmax-rmin))  * (smax - smin)) + smin);
figure; imshow(uint8(B));title('Custom Contrast')

figure;
scatter(double(A(:)),double(B(:)),'Marker','.');
xlabel('Pixel Intensity in image A');
ylabel('Pixel Intensity in image B');
title('Pixel Intensity Comparison');

xlim([20,230]);
ylim([20,230]);