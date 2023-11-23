A=zeros(300,300);
[R C] = size(A);
Cx=150;
Cy=150;
mydis=40;

for i=1:1:R
    for j=1:1:C
        if(abs(i-Cx) + abs(j-Cy))<=mydis %abs means absolute |Cx-i|
            A(i,j)=255;
        end
    end
end
figure=imshow(A,[])
