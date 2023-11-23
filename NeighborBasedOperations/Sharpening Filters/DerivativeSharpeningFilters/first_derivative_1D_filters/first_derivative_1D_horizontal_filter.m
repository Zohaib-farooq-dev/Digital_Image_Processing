%  1D filtering
%this filter itself is horizontal but it will find vertical edges 
filter = [ -1,1];

%reading and converting an image into gray 
A=rgb2gray(imread('flower.png'));

%displaying original image 
figure; imshow(A,[]);title('Original Image');

%applying filter using imfilter function
filteredImage = imfilter(A,filter);

%display filtered image
figure; imshow(filteredImage,[]);title('Filtered Image')