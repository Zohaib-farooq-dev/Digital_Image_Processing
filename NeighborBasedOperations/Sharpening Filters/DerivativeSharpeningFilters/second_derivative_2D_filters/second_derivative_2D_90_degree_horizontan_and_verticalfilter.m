% 90 degree isotropic 2D filtering
filter = [ 0 -1 0; -1 4 -1; 0 -1 0];
%this filter can also be [ 0 1 0;1 -4 1; 0 1 0]

%reading and converting an image into gray 
A=rgb2gray(imread('flower.png'));

%displaying original image 
figure; imshow(A,[]);title('Original Image');

%applying filter using imfilter function
filteredImage = imfilter(A,filter);

%display filtered image
figure; imshow(filteredImage,[]);title('Filtered Image by 2D filter')
