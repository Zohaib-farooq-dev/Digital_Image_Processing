A=[3 4 5 ; 6 7 8 ; 9 10 11];
[R C]=size(A);
B = zeros(R,C)
for i=1:1:R
    for j=1:1:C
        B(i,j) = fix(A(i,j)/2);
    end
end

A
B
