%picking up a high-content image and converting it into gray image 
A=rgb2gray(imread("image.png"));
[R C] = size(A); %taking size of image A
figure;
imshow(A,[]); 
title('Original Image');

denoisedImage = zeros(R,C); %creating a matrix of size A 
filterSize = [3 3]; %filter size i want to apply on my image for example, 3*3,5*5,7*7,9*9,

A1 = imnoise(A,"gaussian",0.3);
A2 = imnoise(A,"salt & pepper",0.3);
Q = -1;

figure;
imshow(A1,[]); 
title('Noisy Image');

%now taking matrix (of size filter) and multiplying it with filter and then
%convert the 2d array into 1d array and get the total sum of this 1d array
%and place this value at filteredimage(i,j)

for i=ceil(filterSize(1)/2):1:R-(floor(filterSize(1)/2))
    for j = ceil(filterSize(1)/2):1:C-(floor(filterSize(2)/2))
        % Here i'm doing like if the filter size is 3*3 then the matrix
        % temp will start from (2,2) of an image A and if 5*5 then start
        % from (3,3) of image A
         myTemp= A1( i-floor(filterSize(1)/2) : i + floor(filterSize(1)/2) , j - floor(filterSize(2)/2) : j + floor(filterSize(2)/2));

         %converting temp matrix into double as our filter is in double 
         Temp = double(myTemp);
         powered_block_1 = Temp .^ (Q +1);
         sum_powered_block_1 = sum(powered_block_1(:));
         powered_block_2 = Temp .^ Q;
         sum_powered_block_2 = sum(powered_block_2(:));

         CHM = sum_powered_block_1 / sum_powered_block_2;
         denoisedImage(i,j) = CHM; % placing this sum at filterimage(i,j)
    end
end

figure;
imshow(denoisedImage,[]); 
title('Denoised Image');