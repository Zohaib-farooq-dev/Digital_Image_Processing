function reverse_mapping_bilinear_rotation 
  % Reading and converting an image to grayscale 
  A = rgb2gray(imread("image.png"));

  % Taking size of image A and creating image B of size A
  [R, C] = size(A);
  B = zeros(R, C);

  % Converting degree angle to radian, negative angle is for rotating the image counterclockwise
  theta = deg2rad(-30);

  % This is the transformation matrix to apply rotation
  transformation_Matrix_Rotation = [cos(theta) sin(theta) 0; -sin(theta) cos(theta) 0; 0 0 1];
  transformation_Matrix_Rotation_inverse = inv(transformation_Matrix_Rotation);

  for i = 1:R
      for j = 1:C
          % Dot product of transformation matrix and a pixel values
          newPosition = transformation_Matrix_Rotation_inverse * [i; j; 1];
          x = newPosition(1);
          y = newPosition(2);
          
          if (x >= 1 && x <= R && y >= 1 && y <= C)
              pos = bilinearInterpolation(newPosition, A);
              B(i, j) = pos;
          end
      end
  end

  % Display the images
  figure; imshow(A, []); title('Original Image');
  figure; imshow(uint8(B), []); title('Altered Image'); % Convert B to uint8 before displaying
end

function resultantValue = bilinearInterpolation(position, image)
    x1 = ceil(position(1));
    x2 = floor(position(1));
    y1 = ceil(position(2));
    y2 = floor(position(2));

    targetPoint = [position(1), position(2)];

    point1 = [x1, y1];
    point2 = [x1, y2];
    point3 = [x2, y1];
    point4 = [x2, y2];

    % Use integer indices to access the image matrix
    averagevalue1 = image(point1(1), point1(2)) * (1 - pdist([point1; point2], 'euclidean')) + image(point2(1), point2(2)) * (1 - pdist([point1; point2], 'euclidean'));
    averagePoint1 = [x1, position(2)];

    averagevalue2 = image(point3(1), point3(2)) * (1 - pdist([point3; point4], 'euclidean')) + image(point4(1), point4(2)) * (1 - pdist([point3; point4], 'euclidean'));
    averagePoint2 = [x2, position(2)];

    resultantValue = averagevalue1 * (1 - pdist([averagePoint1; targetPoint], 'euclidean')) + averagevalue2 * (1 - pdist([averagePoint2; targetPoint], 'euclidean'));
end
