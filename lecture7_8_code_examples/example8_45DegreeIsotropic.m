myFilter7 = [-1 -1 -1; -1 9 -1; -1 -1 -1];

myOrigImage = rgb2gray(imread('flower.png'));

figure; imshow(myOrigImage);

myFilteredImage7 = imfilter(myOrigImage,myFilter7);

figure; imshow(myFilteredImage7,[]);