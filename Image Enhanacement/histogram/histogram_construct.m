A = rgb2gray(imread('image.png'));
[R C] = size(A)
L =256;
histo = zeros(1,L);

for i=1:1:R
    for j=1:1:C
        %constructing histogram 
        histo(A(i,j)+1) = histo(A(i,j)+1) + 1;
    end
end
histo

figure;
plot(histo);
title('Histogram');
xlabel('Intensity');
ylabel('Frequency');