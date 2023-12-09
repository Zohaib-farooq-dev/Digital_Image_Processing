%convert image into rgb and plotting it 
A = rgb2gray(imread('moon.jpeg'));
figure;
imshow(A,[]);
title('Original Image');

mean_A = mean2(A);
std_A = std2(A);

%creating image of size of image A
[R C] = size(A);
B = zeros(R,C);

filter_size = 15;
L =256;

k = 0.5;
for i=1:1:R - filter_size
    for j =1:1:C - filter_size

        %extracting the block of size (filter_size * filter_size
        block = A(i : i + (filter_size-1), j : j + (filter_size-1));
        mean_block = mean2(block);
        std_block = std2(block);
        A_Sxy = (k * mean_A)/std_block; %calculating A_Sxy that will decide how much we need to enhance that block 

        %enhancing the extracted block
        enhanced_block = (A_Sxy * (block - mean_block)) + mean_block;
        %placing that enhanced block into new image B 
        B(i : i + (filter_size-1), j : j + (filter_size-1)) = enhanced_block;

    end
end

%plotting image B
figure;
imshow(B,[]);
title('Enahnced Image using Statistics');
