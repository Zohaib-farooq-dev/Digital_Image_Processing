% Read the cover image and the image to be hidden
cover_image = imread('highContrast.png');
hidden_image = imread('hiding.png');

% Convert images to grayscale
    cover_image = rgb2gray(cover_image);
    hidden_image = rgb2gray(hidden_image);

% Ensure the hidden image is of the same size as the cover image
hidden_image = imresize(hidden_image, size(cover_image));

% Extract bit planes from cover image
bitplanes_cover = cell(8, 1);
for i = 1:8
    bitplanes_cover{i} = bitget(cover_image, i);
end

% Extract bit planes from hidden image
bitplanes_hidden = cell(8, 1);
for i = 1:8
    bitplanes_hidden{i} = bitget(hidden_image, i);
end

% Replace the 1st and 2nd bit planes of cover image with 7th and 8th bit planes of hidden image
for i = 1:2
    bitplanes_cover{i} = bitplanes_hidden{6 + i}; % 6 + i to access 7th and 8th bit planes
end

% Reconstruct the image from modified bit planes
hidden_cover_image = zeros(size(cover_image), 'like', cover_image);
for i = 1:8
    hidden_cover_image = hidden_cover_image + bitplanes_cover{i} * 2^(i-1);
end
hidden_cover_image = uint8(hidden_cover_image);

% Display the original cover image, hidden image, and the resulting image
figure;
subplot(1, 3, 1); imshow(cover_image); title('Cover Image');
subplot(1, 3, 2); imshow(hidden_image); title('Hidden Image');
subplot(1, 3, 3); imshow(hidden_cover_image); title('Hidden Cover Image');
% Read the modified cover image containing the hidden data


% Extract bit planes from the modified cover image
bitplanes_modified_cover = cell(8, 1);
for i = 1:8
    bitplanes_modified_cover{i} = bitget(hidden_cover_image, i);
end

% Create a blank image to store the extracted hidden image
extracted_hidden_image = cell(8, 1);

% Replace the 7th and 8th bit planes of the extracted hidden image with those from the modified cover image
for i = 1:2
    extracted_hidden_image{6+i} = bitplanes_modified_cover{i};
end

% Reconstruct the hidden image from the modified bit planes
hidden_image = zeros(size(hidden_cover_image), 'like', hidden_cover_image);
for i = 1:8
   % Convert bit planes to decimal values
    plane_decimal = extracted_hidden_image{i} * 2^(i-1);
    
    % Append remaining bit planes with zero values
    if isempty(plane_decimal)
        plane_decimal = zeros(size(extracted_hidden_image{7}), 'uint8');
    end
    
    % Perform addition while ensuring consistent data types
    hidden_image = hidden_image + plane_decimal;
end

hidden_image = uint8(hidden_image);

% Display the extracted hidden image
figure;
imshow(hidden_image);
title('Extracted Hidden Image');

