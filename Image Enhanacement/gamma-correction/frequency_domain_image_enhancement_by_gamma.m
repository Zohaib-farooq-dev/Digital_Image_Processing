A = imread('lowContrast.png');
figure;imshow(A,[]);title('Low Contrast')
f = double(A); %converting image into double 

imgFFT = fft2(f);
S=fftshift(imgFFT);
figure; imshow(S,[]);title('Image in frequency domain  ');
c=3 %tuner to see the affect with different values  of c 
gamma = 2 

S1 = fftshift(c .*(imgFFT) .^ (1/gamma))
figure; imshow(S1,[]);title('Enhance image in frequency domain by gamma correction ');

S2 = fftshift(c * log(1 + abs(imgFFT)))
figure; imshow(S,[]);title('Enhance image in frequency domain by log ');