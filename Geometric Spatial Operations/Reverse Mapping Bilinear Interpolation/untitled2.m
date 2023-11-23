function reverse_mapping_bilinear_rotation 
  % Reading and converting an image to grayscale 
  A = rgb2gray(imread('slides.png'));

  % Taking size of image A and creating image B of the same size
  [R, C] = size(A);
  B = zeros(R, C);

  % Converting degree angle to radian (negative angle is for rotating the image counterclockwise)
  theta = deg2rad(-30);

  % Transformation matrix to apply rotation
  transformation_Matrix_Rotation = [cos(theta) sin(theta) 0; -sin(theta) cos(theta) 0; 0 0 1];
  transformation_Matrix_Rotation_inverse = inv(transformation_Matrix_Rotation);

  for i = 1:R
      for j = 1:C
          % Dot product of transformation matrix and a pixel values
          newPosition = transformation_Matrix_Rotation_inverse * [i; j; 1];
          x = round(newPosition(1));
          y = round(newPosition(2));

          % Check if the new coordinates are within bounds
          if x >= 1 && x <= R && y >= 1 && y <= C
              % Perform bilinear interpolation at the new position
              B(i, j) = bilinearInterpolation(newPosition, A);
          end
      end
  end

  % Display the images
  figure; imshow(A, []); title('Original Image');
  figure; imshow(B, []); title('Altered Image');
end

function [resultantValue] = bilinearInterpolation(position, image)
    x1 = floor(position(1));
    x2 = ceil(position(1));
    y1 = floor(position(2));
    y2 = ceil(position(2));

    if x1 < 1 || x2 > size(image, 1) || y1 < 1 || y2 > size(image, 2)
        resultantValue = 0;  % Set to a default value for out-of-bounds coordinates
    else
        dx1 = position(1) - x1;
        dx2 = position(1) - x2;
        dy1 = position(2) - y1;
        dy2 = position(2) - y2;

        % Bilinear interpolation formula
        resultantValue = (1 - dx) * (1 - dy) * image(x1, y1) + dx * (1 - dy) * image(x2, y1) + (1 - dx) * dy * image(x1, y2) + dx * dy * image(x2, y2);
    end
end
