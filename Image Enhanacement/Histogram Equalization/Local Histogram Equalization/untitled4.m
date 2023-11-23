% Read the image
original_image = imread('fingerprint.png'); % Replace 'your_image.jpg' with your image file
% Display the original and processed images
figure;
imshow(original_image);
title('Original Image');

% Convert the image to grayscale if it's an RGB image
if size(original_image, 3) == 3
    original_image = rgb2gray(original_image);
end

% Define the block size for local histogram equalization
block_size = 29; % Adjust the block size as needed

% Get image dimensions
[rows, cols] = size(original_image);

% Initialize the output image
output_image = zeros(rows, cols, 'uint8');

% Perform local histogram equalization
for i = 1:1:rows
    for j = 1:1:cols
        % Define the block limits
        row_end = min(i + block_size - 1, rows);
        col_end = min(j + block_size - 1, cols);
        
        % Extract the block
        block = original_image(i:row_end, j:col_end);
        
        % Apply histogram equalization to the block
        eq_block = histeq(block, 256); % 256 is the number of bins
        
        % Place the equalized block into the output image
        output_image(i:row_end, j:col_end) = eq_block;
    end
end



figure;
imshow(output_image);
title('Local Histogram Equalized Image');
imwrite(output_image,'image.png');
