A=rgb2gray(imread("C:\Users\Muhammad Zohaib Ali\Pictures\Camera Roll\WhatsApp Image 2023-03-31 at 3.34.21 PM.jpeg"));
[R C] = size(A);
myBinary=zeros(R,C);

for i=1:1:R
    for j=1:1:C
        if(A(i,j)>127)
            myBinary(i,j) = 255;
        end
    end
end
figure=imshow(myBinary,[])