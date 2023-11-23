myFilter9 = [-1 -1 0; -1 0 1; 0 1 1];

myOrigImage = rgb2gray(imread('flower.png'));

figure; imshow(myOrigImage);

myFilteredImage9 = imfilter(myOrigImage,myFilter9);

figure; imshow(myFilteredImage9,[]);