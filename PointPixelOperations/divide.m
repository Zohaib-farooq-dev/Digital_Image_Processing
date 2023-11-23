A=rgb2gray(imread("C:\Users\Muhammad Zohaib Ali\Pictures\Camera Roll\WhatsApp Image 2023-03-31 at 3.34.21 PM.jpeg"));
[R C] = size(A);
b = zeros(R,C);

for i=1:1:R
    for j=1:1:C
        b(i,j) = fix(A(i,j)/3);
    end
end

figure=imshow(b,[])
%figure=imshow(A,[]);