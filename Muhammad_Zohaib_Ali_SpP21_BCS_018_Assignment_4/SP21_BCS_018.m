function SP21_BCS_018(imagePath, k0, k1, k2, filterSize)
    % Read the input image
    A = rgb2gray(imread(imagePath));
    figure;
    imshow(A,[]);
    title('Low Contrast Image');
    imwrite(A,'originalImage.bmp');

    % Compute mean and standard deviation of the image
    mean_A = mean2(A);
    std_A = std2(A);

    % Set default values if parameters are not provided
    if nargin == 1
        filterSize =3;
        k0 = 0.4;
        k1 = 0.5;
        k2 = 0.1;
    end

    % Creating an image of the same size as image A
    [R, C] = size(A);
    B = zeros(R, C);

    % Applying the local enhancement by multiplying the block by value 2 
    for i = 1:1:R - filterSize
        for j = 1:1:C - filterSize
            % Extracting the block of size (filterSize * filterSize)
            block = A(i : i + (filterSize-1), j : j + (filterSize-1));
            mean_block = mean2(block);
            std_block = std2(block);

            % Applying conditions for local enhancement 
            if mean_block < (k0 * mean_A)  && ((k2 * std_A) < std_block) && (std_block < (k1 * std_A))
                % Enhancing the extracted block
                enhanced_block = block * 2;
                % Placing the enhanced block into new image B 
                B(i : i + (filterSize-1), j : j + (filterSize-1)) = enhanced_block;
            else 
                B(i : i + (filterSize-1), j : j + (filterSize-1)) = block;
            end
        end
    end

    % Plotting the resulting image B
    figure;
    imshow(B,[]);
    title('Locally Enhanced Image');
    imwrite(uint8(B),'enhancedImage.jpeg');
    close all;
end
