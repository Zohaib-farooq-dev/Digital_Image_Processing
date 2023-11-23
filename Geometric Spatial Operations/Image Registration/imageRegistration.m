A = rgb2gray(imread('original.png'));
figure; imshow(A,[]); title('Original Image');

B = rgb2gray(imread("rotated.png"));
figure; imshow(B,[]); title('Rotated Image');

[fixedPoints,movingPoints] = cpselect(B,A,'Wait',true);
fixedPoints
movingPoints
tform = fitgeotrans(movingPoints, fixedPoints,'Projective');
class(tform)
C = imwarp(B,tform);
figure; imshow(C,[]);title('Registered Image');