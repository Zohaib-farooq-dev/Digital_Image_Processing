A = imread('lowContrast.png');
figure;imshow(A,[]);title('Low Contrast')
f = double(A); %converting image into double 
[R C] = size(A);
B = zeros(R,C);
B = double(B);
c=10 ;%tuner to see the affect with different values  of c 
%running loop to apply log transformation function which is S = clog(1+r)
for i=1:1:R
    for j =1:1:C
        B(i,j) = c * log(1 + f(i,j));
    end
end
figure; imshow(B,[]);title('High Contrast by Log ');

%plotting the two images 1st original and then enhanced by log transformation 
figure;
scatter(f(:),B(:),'Marker','.');
xlabel('Pixel intensity in image A');
ylabel('Pixel intensity in image B');
title('Pixel Intensity Comparison with Logarithmic Transformation Curve');
legend('Pixel Intensity Comparison');