%motion blurrr filter 
myFilter4 = 1/9*eye(9);
[R C] = size(myFilter4)
% Initialize the reversed filter
reversedFilter = myFilter4;
% Reverse the main diagonal
for i = 1: 1:R
    reversedFilter(i, i) = myFilter4(R- i + 1, R - i + 1);
end

myOrigImage = rgb2gray(imread('flower.png'));

figure; imshow(myOrigImage);

myFilteredImage4 = imfilter(double(myOrigImage),reversedFilter);

figure; imshow(myFilteredImage4,[]);