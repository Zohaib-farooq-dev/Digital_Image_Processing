
function reverse_mapping_bilinear_rotation 
  %reading and converting an image to grayscale 
  A =  rgb2gray(imread("slides.png"));

  %taking size of image A and creating image B of size A
  [R C] = size(A);
  B = zeros(R, C);

  %converting degree angle to radian , negative angle is for to rotate the image in anticlockwise direction 
  theta = deg2rad(-10);

  %this is the transformation matrix to apply rotation
  transformation_Matrix_Rotation= [cos(theta) sin(theta) 0; -sin(theta)  cos(theta) 0 ; 0 0 1];
  transformation_Matrix_Rotation_inverse= inv(transformation_Matrix_Rotation);

  for i=1:1:R
      for j=1:1:C
          %dot product of transfromation matrix and a pixel values
          newPosition = transformation_Matrix_Rotation_inverse * [i; j; 1] ;
          x = newPosition(1);
          y = newPosition(2);

         
          if ( ~isinteger(newPosition) && x>=1 && x<=R && y>=1 &&y<=C )
               pos = bilinearInterpolation(newPosition, A);
               pos;
               B(i,j) = pos;
          elseif isinteger(newPosition)
               %placing the i,j pixel value at it's new position in B image 
               A(x,y);
               B(i,j) = A(x,y);
          end
     end
  end

  %diaply the images
  figure; imshow(A,[]); title('Original Image');
  figure; imshow(B,[]); title('Altered Image');
end

function [resultantValue] = bilinearInterpolation( position,image )
   
          x1 = floor(position(1));
          x2 = ceil(position(1));
          y1 = floor(position(2));
          y2 = ceil(position(2));

          targetPoint = [position(1),position(2)];

          point1 = [x1,y1];
          point2 = [x1,y2];
          point3 = [x2,y1];
          point4 = [x2,y2];

          dx1 = position(1) - x1;
          dx2 = position(1) - x2;
          dy1 = position(2) - y1;
          dy2 = position(2) - y2;
          averagevalue1 = image(x1,y1) * (1-dy1) + image(x1,y2) * (1-dy2 );
       

          averagevalue2 = image(x2,y1) * (1-dy1) + image(x2,y2) * (1- dy2) ;
          

          resultantValue = averagevalue1 * (1-dx1) + averagevalue2 * (1-dx2);


end
