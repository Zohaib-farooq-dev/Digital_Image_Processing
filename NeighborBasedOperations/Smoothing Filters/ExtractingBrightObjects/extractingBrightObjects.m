%picking up a high-content image and converting it into gray image 
A=rgb2gray(imread("C:\Users\Muhammad Zohaib Ali\Desktop\MATLAB\NeighborBasedOperations\stars.jpg"));
[R C] = size(A); %taking size of image A
filteredImage = zeros(R,C); %creating a matrix of size A 
filterSize = [9 9]; %filter size i want to apply on my image for example, 3*3,5*5,7*7,9*9,
mask= 1/(filterSize(1)*filterSize(2)); %as this is the box averaging so the mask(variable-it's not the term mask used in averaging concept) should be 1/filtersize*filtersize
%general code for making a filter/mask
myFilter= zeros(filterSize);
for i=1:1:filterSize(1)
    for j=1:1:filterSize(2)
        myFilter(i,j) = mask;
    end
end 
%multiline comment 
%now taking matrix (of size filter) and multiplying it with filter and then
%convert the 2d array into 1d array and get the total sum of this 1d array
%and place this value at filteredimage(i,j)
for i=ceil(filterSize(1)/2):1:R-(floor(filterSize(1)/2))
    for j = ceil(filterSize(1)/2):1:C-(floor(filterSize(2)/2))
        % Here i'm doing like if the filter size is 3*3 then the matrix
        % temp will start from (2,2) of an image A and if 5*5 then start
        % from (3,3) of image A
         myTemp= A( i-floor(filterSize(1)/2) : i + floor(filterSize(1)/2) , j - floor(filterSize(2)/2) : j + floor(filterSize(2)/2));
         %converting temp matrix into double as our filter is in double 
         Temp = double(myTemp);
         myN = Temp .* myFilter; %multiplying the 2 matrices
         myNR=reshape(myN,1,[]); %converting 2d array into 1d 
         myNRS = sum(myNR); %getting total sum of this array
         filteredImage(i,j) = myNRS; % placing this sum at filterimage(i,j)
    end
end
%doing binarization - converting grayscale image into binary image
binaryFilteredImage = zeros(R,C);
for i = 1:1:R
    for j=1:1:C
        if filteredImage(i,j) >127
            binaryFilteredImage(i,j)=255;
        end
    end
end
%multiline comment 
%here i'm extracting bright stars by comparing the binary image , if at
%(i,j) of binary image there is 1 or 255 then put the value of A(i,j) at
%brightStars(i,j)
brightStars =zeros(R,C);
for i = 1:1:R
    for j=1:1:C
        if binaryFilteredImage(i,j) == 255
            brightStars(i,j)= A(i,j);
        end
    end
end


%figure = imshow(filteredImage,[])
figure=imshow(brightStars,[]);     