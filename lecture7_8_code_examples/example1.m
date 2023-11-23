%
myFilter1 = [1 1 1; 1 1 1; 1 1 1];

myOrigImage = rgb2gray(imread('flower.png'));

figure; imshow(myOrigImage); title('Original Image');

myFilteredImage = imfilter(double(myOrigImage),myFilter1);

figure; imshow(myFilteredImage,[]); title('filtered Image');