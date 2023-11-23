%reading the low contrast image and plot the image and it's histogram
A = rgb2gray(imread('ocean_low_contrast.png'));
figure; subplot(3,2,1);imshow(A,[]);title('Original Image');
hist_A = imhist(A);
subplot(3,2,2);bar(hist_A);title('Histogram before any enhancement');

%applying histogram equalization on image A  and plot the image B  and it's histogram
B = histeq(A);
subplot(3,2,3);imshow(B,[]);title('Histogram equalized Image');
hist_B = imhist(B);
subplot(3,2,4);bar(hist_B);title('Histogram after Equalization');

%applying histogram stretching (contrast stretching) on image A  and plot the image C  and it's histogram
C = imadjust(A);
subplot(3,2,5);imshow(uint8(C));title('Contrast Stretched Image');
hist_C = imhist(C);
subplot(3,2,6);bar(hist_C);title('Histogram after Contrast Stretching');

