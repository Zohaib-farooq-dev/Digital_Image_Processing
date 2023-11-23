%reading the image , converting it into grayscale and plotting it 
A = rgb2gray(imread('book_corner_box.png'));
figure;
imshow(A,[]);
title('Low Contrast Image');

%creating new image B of size image A
[R C] = size(A);
B = zeros(R,C);

%defining the 1d arrays we need for histogram equalization 
L=256;
gray_levels = zeros(1,L);
frequency = zeros(1,L);
probability = zeros(1,L);
cdf_A = zeros(1,L);
cdf_B = zeros(1,L);
lut = zeros(1,L);

%calculating frequencies of each gray-level in the image 
for i =1:1:R
    for j =1:1:C
        frequency(A(i,j)+1) = frequency(A(i,j)+1) +1;
    end
end

%calculating cdf and building lut(look-up table)
probability = frequency ./ (R *C) ;
cdf_A = cumsum(probability);
lut = cdf_A .* (L-1);

%Mapping the new pixel value of image A to image B using look-up table  
for i=1:1:R
    for j =1:1:C
        B(i,j) = lut(A(i,j)+1);
    end
end

%plotting the histogram and cdf of image A
histo = imhist(A);
figure;
bar(histo);
title('Before equalization');
hold on;
plot(cdf_A * max(histo),'r','LineWidth',3);
hold off;

%plotting the histogram and cdf of image A
histo1 = imhist(uint8(B));
cdf_B = cumsum(histo1)/(R*C);
figure;
bar(histo1);
title('After equalization');
hold on;
plot(cdf_B *max(histo1) ,'r','LineWidth',3);
hold off;

%plotting the histogram equalized image 
figure;
imshow(B,[]);
title('Histogram Equalized Image');