LowContrastImg = imread("lowContrastpng.png");
[R, C] = size(LowContrastImg);
figure;
imshow(LowContrastImg);

f = double(LowContrastImg);

Rmin = min(min(f));
disp(Rmin);
Rmax = max(max(f));
disp(Rmax);

EnhancedHighContr = zeros(R, C);

for i = 1:R
    for j = 1:C
        EnhancedHighContr(i, j) = (f(i, j) - Rmin) ./ (Rmax - Rmin) * 255;
    end
end

figure;
imshow(uint8(EnhancedHighContr));

