%reading the image and plotting it with it's histogram 
A = rgb2gray(imread('lowContrast.png'));
hist_A = imhist(A);
figure; subplot(2,2,1);imshow(A,[]);title('Original Image');
subplot(2,2,2);bar(hist_A);title('Histogram of Image');

%sliding the histogram of image A and then plotting it 
B = A + 30;
hist_B = imhist(B);
subplot(2,2,3);imshow(B,[]);title('Original Image');
subplot(2,2,4);bar(hist_B);title('Slided Histogram');