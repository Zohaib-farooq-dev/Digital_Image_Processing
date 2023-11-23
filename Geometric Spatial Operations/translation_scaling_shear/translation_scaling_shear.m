%reading and converting an image to grayscale 
A =  rgb2gray(imread("image.png"));

%taking size of image A and creating image B of size A
[R C] = size(A);
B = zeros(R, C);

%these are the transformation matrices for applying different geometric operations
transformation_Matrix_Translation = [1 0 20; 0 1 30 ; 0 0 1];
transformation_Matrix_Scaling = [2 0 0; 0 2 0 ; 0 0 1];

%it means that a0x will be 1 if we want to apply shear along x-axis and b0y will be zero
transformation_Matrix_Shear_along_x_axis = [1 0.3 0; 0 1 0 ; 0 0 1];

%and here when we want to apply shear along y-axis a0x will be 0 and b1y will be 1 
transformation_Matrix_Shear_along_y_axis = [1 0 0; 0.3 1 0 ; 0 0 1];


for i=1:1:R
    for j=1:1:C
        %dot product of transfromation matrix and a pixel values
        newPosition = transformation_Matrix_Shear_along_x_axis * [i; j; 1] ;
        x = newPosition(1);
        y = newPosition(2);

        if x < 0 || x > R || y < 0 || y > C
            %excluding the extra content from our image 
            continue;
        end 

        %placing the i,j pixel value at it's new position in B image 
        B(ceil(x),ceil(y)) = A(i,j) ;
    end
end

%diaply the images
figure; imshow(A,[]); title('Original Image');
figure; imshow(B,[]); title('Altered Image');

