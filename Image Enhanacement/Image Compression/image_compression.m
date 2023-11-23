original_image =  rgb2gray(imread('image.png'))

% Read the original image
%original_image = imread('your_image.jpg'); % Replace 'your_image.jpg' with your image file

% Extract the 7th and 8th bit planes of the image
bitplane_7 = bitget(original_image, 7);
bitplane_8 = bitget(original_image, 8);

% Combine 4 pixels into a single pixel (representing 8 bits using 2 bits for each pixel)
compressed_image = bitshift(bitplane_8, 6) + bitshift(bitplane_7, 7) + ...
                   bitshift(bitplane_8, 4) + bitshift(bitplane_7, 5) + ...
                   bitshift(bitplane_8, 2) + bitshift(bitplane_7, 3) + ...
                   bitshift(bitplane_8, 0) + bitshift(bitplane_7, 1);

% Display the original and compressed images
figure;
subplot(1, 2, 1); imshow(original_image); title('Original Image');
subplot(1, 2, 2); imshow(uint8(compressed_image)); title('Compressed Image (Merged Pixels)');
