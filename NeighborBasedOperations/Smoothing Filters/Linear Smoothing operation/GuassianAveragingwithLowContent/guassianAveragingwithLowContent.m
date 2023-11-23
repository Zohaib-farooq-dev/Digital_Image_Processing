%picking up a low-content image and converting it into gray image 
A=rgb2gray(imread("C:\Users\Muhammad Zohaib Ali\Desktop\MATLAB\NeighborBasedOperations\Linear Neighborbased operation\GuassianAveragingwithLowContent\Low-ContentImage.jpeg"));
[R C] = size(A); %taking size of image A
filteredImage = zeros(R,C); %creating a matrix of size A 
filterSize = [5 5]; %filter size i want to apply on my image for example, 3*3,5*5,7*7,9*9,
myFilter= [1 1 2 1 1 ; 1 2 4 2 1;2 4 8 4 2 ;1 2 4 2 1;1 1 2 1 1 ]; %filter i want to apply
myFilterR=reshape(myFilter,1,[]); %converting it into a row vector
myFilterRS= sum(myFilterR); %sum of 1d array
for i=1:1:filterSize(1)
    for j=1:1:filterSize(2)
        myFilter(i,j) = myFilter(i,j)/myFilterRS;
        myFilter(i,j)
    end
end 
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

figure=imshow(filteredImage,[]);     