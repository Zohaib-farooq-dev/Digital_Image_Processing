%convert image into rgb and plotting it 
A = rgb2gray(imread('tungsten.png'));
figure;
imshow(A,[]);
title('Low Contrast Image');

mean_A = mean2(A);
std_A = std2(A);

%creating image of size of image A
[R C] = size(A);
B = zeros(R,C);

filter_size = 3;
L =256;

k0 = 0.4;
k1 = 0.5;
k2 = 0.1;
for i=1:1:R - filter_size
    for j =1:1:C - filter_size

        %extracting the block of size (filter_size * filter_size
        block = A(i : i + (filter_size-1), j : j + (filter_size-1));
        mean_block = mean2(block);
        std_block = std2(block);

        if mean_block < (k0 * mean_A)  && ((k2 * std_A) < std_block) && (std_block < (k1 * std_A))
           %equalizing the extracted block
           eq_block = histeq(block);
           %placing that equalized block into new image B 
           B(i : i + (filter_size-1), j : j + (filter_size-1)) = eq_block;
        else 
             B(i : i + (filter_size-1), j : j + (filter_size-1)) = block;
        end

    end
end
%plotting image B
figure;
imshow(B,[]);
title(' Adaptively Histogram Equalized Image');


K = adapthisteq(A);
figure;
imshow(K,[]);
title('Adaptively Histogram Equalized Image using built-in function ');