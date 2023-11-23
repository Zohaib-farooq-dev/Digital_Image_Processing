A=zeros(300,300);
[R C] = size(A);
Cx=150;
Cy=150;
myRad=40;

for i=1:1:R
    for j=1:1:C
        if(sqrt((i-Cx)^2 + (j-Cy)^2 ))<=myRad
            A(i,j)=255;
        end
    end
end
figure=imshow(A,[])

     
