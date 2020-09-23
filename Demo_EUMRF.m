close all; 
clear all;
clc;
warning off;

format long

class_number = 3;

beta = 0.5;

bw   = 0.2; 

maxIter=3;

%% Read and resize Original Image 

image = imread('ISIC_0000003.jpg');
image = imresize(image,[246,246]);


%% Read and Resize Ground Truth Image 

seg_image = imread('ISIC_0000003_segmentation.png');
seg_image = logical(imresize(seg_image,[244,244]));


%% Enhance an input image using convolution function 'Conv' 
im = conv(image);
I = uint8(im);  % convert an image to Uint8 type 
II = I; 

ori_image = rgb2gray(I); % convert to color image to gray image 
org_image = im2bw(ori_image); %convert gray image to binary image  

i =0 ;
while (true)
    [Ims, RatArea, Nms2] = Ms2(I,bw);    % Mean Shift (color + spatial)
    % calculate EUMRF model using 'Seg_EUMRF function' 
    segmentation = Seg_EUMRF(I, Ims, class_number, beta, maxIter);  
    %evaluate the segmented image using Jaccard index and Jaccard distance
    %function 'jaccard_coefficient'
    [JIdx,JDist] = jaccard_coefficient(org_image , seg_image)
    if JDist <=0.10 || JIdx <= 0.10
        break;
    else
        i = i + 1
    end
end
seg = segmentation(:,:,1);
seg = imcomplement(segmentation(:,:,1));

%% evaluate the segmented image using other matrics such as Rand index, GCE, Variation of information 
 %Using compare_segmentations Function
a=imstack2vectors(seg);
a = kmeans(a,2);
b=imstack2vectors(org_image);
b = kmeans(b,2);
[ri,gce,vi]=compare_segmentations(a,b)

%% Display original image and segmented image 

subplot(121); imshow(image);   title('Original'); 
subplot(122); imshow(seg);  title('Segmented image');







