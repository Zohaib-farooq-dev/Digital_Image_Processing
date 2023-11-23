%this is the same example as example # 3with slight change in filter 
% which will give us more blurred image than the previous filter 

myFilter3 = 1/13*[1 0 0 0 1; 0 1 1 1 0; 1 1 1 1 1; 0 1 1 1 0; 1 0 0 0 1];

myOrigImage = rgb2gray(imread('flower.png')); 

figure; imshow(myOrigImage); title('Original Image');

myFilteredImage2 = imfilter(double(myOrigImage),myFilter3);

figure; imshow(myFilteredImage2,[]); title('Filtered Image');