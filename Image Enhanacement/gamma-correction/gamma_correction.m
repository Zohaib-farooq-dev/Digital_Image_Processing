A = imread('lowContrast.png');
figure;imshow(A,[]);title('Low Contrast')
f = double(A); %converting image into double 
[R C] = size(A);
B = zeros(R,C);
B = double(B);
c=3 %tuner to see the affect with different values  of c 
gamma = 2 
% second tuner to see the affect of different values of gamma in gamma-correction
%this bigger value of gamma tends an image to brighten whereas if we have gamma = 0.5 it will tend image to darkness 

%running loop to apply log transformation function which is S = clog(1+r)
for i=1:1:R
    for j =1:1:C
        %f1 = f(i,j)
        r = f(i,j);
        B(i,j) = c * r ^ (1/gamma);
        %b = B(i,j)
    end
end
figure; imshow(B,[]);title('High Contrast by Log ');

%plotting the two images 1st original and then enhanced by log transformation 
figure;
scatter(double(A(:)),double(B(:)),'Marker','.');
xlabel('Pixel intensity in image A');
ylabel('Pixel intensity in image B');
title(['Pixel Intensity Comparison with Gamma Correction Curve (1/Gamma = ' num2str(1/gamma) ')']);
legend('Pixel Intensity Comparison');