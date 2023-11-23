%this filter is identity filter will give us the original image as it is 
myFilter2 = [0 0 0; 0 1 0; 0 0 0];

myOrigImage = rgb2gray(imread('flower.png')); 

figure; imshow(myOrigImage); title('Original Image');

myFilteredImage2 = imfilter(double(myOrigImage),myFilter2);

figure; imshow(myFilteredImage2,[]); title('Filtered Image');