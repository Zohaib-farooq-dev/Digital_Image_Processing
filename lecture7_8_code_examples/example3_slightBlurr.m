%this filter will give us the blurr image as it's weight sum is 1 and all weights are ositive 
myFilter3 = 1/13*[0 0 1 0 0; 0 1 1 1 0; 1 1 1 1 1; 0 1 1 1 0; 0 0 1 0 0];

myOrigImage = rgb2gray(imread('flower.png')); 

figure; imshow(myOrigImage); title('Original Image');

myFilteredImage2 = imfilter(double(myOrigImage),myFilter3);

figure; imshow(myFilteredImage2,[]); title('Filtered Image');