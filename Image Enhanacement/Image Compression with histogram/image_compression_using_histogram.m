% Read the image and convert it to grayscale
image = rgb2gray(imread('lowContrast.png'));

% Define the number of bit planes
num_bit_planes = 8; % For an 8-bit image

% Initialize an array to store histograms for each bit plane
histograms = cell(1, num_bit_planes);

% Compute histograms for each bit plane
for plane = 1:num_bit_planes
    % Extract the 'plane'th bit plane from the image
    bit_plane = bitget(image, plane);
    
    % Compute the histogram for the 'plane'th bit plane
    histograms{plane} = imhist(bit_plane);
end

% Analyze histograms to decide which bit planes contain relevant information
% Find the bit plane with the highest frequency content
max_frequency = 0;
bit_plane_to_compress = 0;

for plane = 1:num_bit_planes
    % Calculate total frequency content of the histogram for each bit plane
    total_frequency = sum(histograms{plane});
    
    % If the total frequency is higher, update max_frequency and bit_plane_to_compress
    if total_frequency > max_frequency
        max_frequency = total_frequency;
        bit_plane_to_compress = plane;
    end
end


% Combine 4 pixels into a single pixel (representing 8 bits using 2 bits for each pixel)
compressed_image = bitshift(bit_plane_to_compress, 6) + ...
                   bitshift(bit_plane_to_compress, 4) + ...
                   bitshift(bit_plane_to_compress, 2) + ...
                   bitshift(bit_plane_to_compress, 0) ;

% Display the original and compressed images
figure;
subplot(1, 2, 1); imshow(image); title('Original Image');
subplot(1, 2, 2); imshow(uint8(compressed_image)); title('Compressed Image (Merged Pixels)');

