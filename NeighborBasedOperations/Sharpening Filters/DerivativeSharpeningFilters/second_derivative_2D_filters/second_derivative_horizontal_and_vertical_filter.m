%  2D filtering
filter = [ -1;2;-1];

%reading and converting an image into gray 
A=rgb2gray(imread('flower.png'));

%displaying original image 
figure; imshow(A,[]);title('Original Image');

%applying filter using imfilter function
filteredImage = imfilter(A,filter);

%display filtered image
figure; imshow(filteredImage,[]);title('Filtered Image vertical filter')



% 90 degree isotropic 2D filtering
filter = [ -1,2,-1];

%applying filter using imfilter function
filteredImageHorizontal = imfilter(A,filter);

%display filtered image
figure; imshow(filteredImageHorizontal,[]);title('Filtered Image horizontal filter ')