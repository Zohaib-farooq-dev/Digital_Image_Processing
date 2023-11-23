A=rgb2gray(imread("C:\Users\Muhammad Zohaib Ali\Pictures\Camera Roll\WhatsApp Image 2023-03-31 at 3.34.21 PM.jpeg"));
[R C] = size(A); %taking size of image A
B=imnoise(A,"salt & pepper",0.0001);%if you want to add pepper noise you have to write "pepper & salt" with low density
maxfilteredImage = zeros(R,C); %creating a matrix of size A 
filterSize = [3 3]; %filter size i want to apply on my image for example, 3*3,5*5,7*7,9*9,
%now taking matrix (of size filter) and calculating the max value of this
%1d array
%convert the 2d array into 1d array and get the total sum of this 1d array
%and place this value at filteredimage(i,j)
for i=ceil(filterSize(1)/2):1:R-(floor(filterSize(1)/2))
    for j = ceil(filterSize(1)/2):1:C-(floor(filterSize(2)/2))
        % Here i'm doing like if the filter size is 3*3 then the matrix
        % temp will start from (2,2) of an image A and if 5*5 then start
        % from (3,3) of image B
         myTemp= B( i-floor(filterSize(1)/2) : i + floor(filterSize(1)/2) , j - floor(filterSize(2)/2) : j + floor(filterSize(2)/2));
         myNR=reshape(myTemp,1,[]); %converting 2d array into 1d 
         maxfilteredImage(i,j) = max(myNR); % placing this sum at filterimage(i,j)
    end
end
%figure=imshow(B,[])
figure=imshow(maxfilteredImage,[]);     