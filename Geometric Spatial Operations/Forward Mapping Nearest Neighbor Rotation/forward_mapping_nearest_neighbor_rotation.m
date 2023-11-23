%reading and converting an image to grayscale 
A =  rgb2gray(imread("image.png"));

%taking size of image A and creating image B of size A
[R C] = size(A);
B = zeros(R, C);

%converting degree angle to radian , negative angle is for to rotate the image in anticlockwise direction 
theta = deg2rad(-30)

%this is the transformation matrix to apply rotation
transformation_Matrix_Rotation= [cos(theta) sin(theta) 0; -sin(theta)  cos(theta) 0 ; 0 0 1]

for i=1:1:R
    for j=1:1:C
        %dot product of transfromation matrix and a pixel values
        newPosition = transformation_Matrix_Rotation * [i; j; 1] ;
        x = round(newPosition(1));
        y = round(newPosition(2));
     
        if x <= 0 || x > R || y <= 0 || y > C
            %excluding the extra content from our image 
            continue;
        end 

        %placing the i,j pixel value at it's new position in B image 
        B(x,y) = A(i,j);
    end
end

%diaply the images
figure; imshow(A,[]); title('Original Image');
figure; imshow(B,[]); title('Altered Image');
