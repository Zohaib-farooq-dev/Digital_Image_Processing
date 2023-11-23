function mySecondAssignment(filename ,n)

    % reading and converting an image to grayscale
    A = rgb2gray(imread(filename));

    %taking size of an image A using size() function 
    [R C] = size(A); 

    %creating 2 images of size [R C] 
    denoisedImage_averaging = zeros(R,C);
    denoisedImage_median = zeros(R,C);

    % adding 'salt & pepper' noise in the image A 
    B = imnoise(A,'salt & pepper',0.3); 

    %displaying the 2 images. One is Original Image and the other one is Noisy Image  
    figure; imshow(A,[]); title('Original Image');
    figure; imshow(B,[]); title('Noisy Image');

    %these are helping variables to generalize the code to fit for any size of image andfilter (3*3,5*5,7*7, and so on)
    terminator = n/2;
    start = ceil(terminator);
    term2 = floor(terminator);
    
    %as this is the box averaging so the mask(variable-it's not the term mask used in averaging concept) should be 1/ (n*n)
    mask= 1/(n * n); 

    %-------------------Convolution (Averaging) Filter---------------------%

    %general code for making a filter/mask
    myFilter= zeros(n,n);
    for i=1:1:n
       for j=1:1:n
          myFilter(i,j) = mask;
       end
    end

    %now taking matrix (of size filter) and multiplying it with filter and then
    %convert the 2d array into 1d array and get the total sum of this 1d array
    %and place this value at filteredimage(i,j)

    for i=start:1:R-term2
       for j = start:1:C-term2

          % Here i'm doing like if the filter size is 3*3 then the matrix
          % temp will start from (2,2) of an image A and if 5*5 then start
          % from (3,3) of image A
          myTemp= A( i-term2 : i + term2 , j - term2 : j + term2);

          %converting temp matrix into double as our filter is in double 
          Temp = double(myTemp);

          %multiplying the 2 matrices
          convolutionedMatrix = Temp .* myFilter;

          %converting 2d array into 1d 
          reshapedMatrix=reshape(convolutionedMatrix,1,[]);

          %getting total sum of this array
          myNRS = sum(reshapedMatrix); 

          % placing this sum at filterimage(i,j)
          denoisedImage_averaging(i,j) = myNRS;
      end
    end
   

    %-------------------Median Filter---------------------%

    for i=start:1:R-term2
      for j = start:1:C-term2

          % Here i'm doing like if the filter size is 3*3 then the matrix
          % temp will start from (2,2) of an image  and if 5*5 then start
          % from (3,3) of image 
          myTemp= B(i-term2 : i + term2 , j - term2 : j + term2); 

          %converting 2d array into 1d 
          myNR=reshape(myTemp,1,[]); 

          % placing this sum at filterimage(i,j)
          denoisedImage_median(i,j) = median(myNR); 
      end
    end
   

    % display and save the result images of Averagign Filter and Median Filter into the current directory
    
    figure; imshow(denoisedImage_averaging,[]);  title('Image by Averaging Filter');
    saveas(gcf,'denoisedImage_averaging.bmp');

    figure; imshow(denoisedImage_median,[]);  title('Image by Median Filter');
    saveas(gcf,'denoisedImage_median.jpeg');
end




