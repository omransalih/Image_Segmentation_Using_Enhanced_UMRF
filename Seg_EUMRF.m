function segmentation = Seg_UMRF(image, ms_image , class_number, beta ,maxIter)
[width,height, bands]=size(image);
imagevec=imstack2vectors(image);
imagevec = double(imagevec);
[segmentation1,c]=kmeans(imagevec,class_number);

 ms_image=imstack2vectors(ms_image);
 [segmentation2,c]=kmeans(ms_image,class_number);
 
 [r s] = coloredges(image);
 %pre = wiener2(s,[6,6]);
 Id=imstack2vectors(r);
 [segmentation3,c]=kmeans(Id,class_number);
 
 %X = segmentation1;
 %Y = segmentation1;
 
%  ori_image = rgb2gray(image);
%  org_image = im2bw(ori_image);

clear c;
iter = 0;
%while (iter<maxIter)
    
    [mu1,sigma1]= parameter_setting(imagevec,segmentation1,class_number);
    YPSF = YPS(imagevec, mu1, sigma1, class_number) ;
    
    [mu2,sigma2]= parameter_setting(ms_image,segmentation2,class_number);
    YRSF = YRS(ms_image, mu2, sigma2, class_number);
    
    [mu3,sigma3]= parameter_setting(Id,segmentation3,class_number);
    Pedge = edgeProb(Id, mu3, sigma3, class_number);
    
    %P = LabelRandomField(image,beta,width,height,bands, class_number);
    P = gibs(image,class_number , beta);
    
%     seg = YRSF .* YPSF .* Pedge .* P;
%     segmentation = max(seg,[],2);
    seg = log(YRSF + YPSF  + Pedge + P )  ;%  .*    
    segmentation = min(seg,[],2);
    

 
segmentation = reshape(segmentation,[width height class_number]);
end