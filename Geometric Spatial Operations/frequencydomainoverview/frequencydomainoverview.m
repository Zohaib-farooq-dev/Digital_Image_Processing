A = rgb2gray(imread('image.png'));
figure; imshow(A,[]); title('Original Image');

imgFFT = fft2(double(A));



S=fftshift(imgFFT); 
S1 =fftshift(log(1+abs(imgFFT)));

figure;imshow(S,[]);title('Without Log');
figure;imshow(S1,[]);title('With Log');


