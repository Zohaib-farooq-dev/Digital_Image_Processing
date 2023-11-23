%convert image into rgb and plotting it 
A = rgb2gray(imread('book_corner_box.png'));
figure;
imshow(A,[]);
title('Low Contrast Image');

%creating image of size of image A
[R C] = size(A);
B = zeros(R,C);

filter_size = 3;
L =256;

for i=1:1:R - filter_size
    for j =1:1:C - filter_size

        %extracting the block of size (filter_size * filter_size
        block = A(i : i + (filter_size-1), j : j + (filter_size-1));
        %equalizing the extracted block
        eq_block = histeq(block);
        %placing that equalized block into new image B 
        B(i : i + (filter_size-1), j : j + (filter_size-1)) = eq_block;
    end
end
%plotting image B
figure;
imshow(B,[]);
title('Histogram Equalized Image');