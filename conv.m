function Out = conv(im) 
%MATLAB CODE:
%INPUT  MATRIX
% im = imread('(11).jpg');
% im = imresize(im,[256,256]); 
% im = rgb2gray(im); 

I = double(im);
r = I(:,:,1);
g=I(:,:,2);
b=I(:,:,3);
%A = zeros(256);
%A(:) = 1:25;

%KERNEL
avg3 = ones(3)/9;


%PAD THE MATRIX WITH ZEROS
%B = padarray(I,[1 1]);
%B = double(B);
% PRE-ALLOCATE THE MATRIX
Out = zeros(size(I,1)-2);

%PERFORM COONVOLUTION
for i = 1:size(I,1)-2
    for j = 1:size(I,2)-2
        Temp1 = r(i:i+2,j:j+2).*avg3;
        Temp2 = g(i:i+2,j:j+2).*avg3;
        Temp3 = b(i:i+2,j:j+2).*avg3;
        if i <= size(I,1)- 2
            Out1(i,j) = sum(Temp1(:));
            Out2(i,j) = sum(Temp2(:));
            Out3(i,j) = sum(Temp3(:));
        end
    end
end
Out = cat(3,Out1, Out2, Out3); 
imshow(uint8(Out)) 