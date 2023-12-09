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

k = 0.5; % tuner for equation A_Sxy = (k * mean_A)/std_block

%tuners for the condition mean_block < (k0 * mean_A)  && ((k2 * std_A) < std_block) && (std_block < (k1 * std_A))
%k0 is tuner for checking mean of the block
k0 = 0.4;

%k1 & k2 are tuners for std to select that region which we want to enhance escaping the other regions
k1 = 0.8;
k2 = 0;
for i=1:1:R - filter_size
    for j =1:1:C - filter_size

        %extracting the block of size (filter_size * filter_size
        block = A(i : i + (filter_size-1), j : j + (filter_size-1));
        mean_block = mean2(block);
        std_block = std2(block);
        A_Sxy = (k * mean_A)/std_block; %calculating A_Sxy that will decide how much we need to enhance that block 

        if mean_block < (k0 * mean_A)  && ((k2 * std_A) < std_block) && (std_block < (k1 * std_A))
             B(i : i + (filter_size-1), j : j + (filter_size-1)) = block;
        else 
             %enhancing the extracted block
             enhanced_block = (A_Sxy * (block - mean_block)) + mean_block;
             %placing that enhanced block into new image B 
             B(i : i + (filter_size-1), j : j + (filter_size-1)) = enhanced_block;
        end

    end
end

%plotting image B
figure;
imshow(B,[]);
title('Enahnced Image using Statistics & AHE');
