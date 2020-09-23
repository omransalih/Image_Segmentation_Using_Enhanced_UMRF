function [P]=LabelRandomField(image,beta,width,height, bands,class_number)

n = width * height;
P=zeros(n,bands,class_number);
for j = 1 : bands 
    imagevec = imstack2vectors(image(:,:,j));
    [segmentation,c]=kmeans(imagevec,class_number);
    segmentation=reshape(segmentation,[width height]);
    Nei8=imstack2vectors(NeiX(segmentation));
    for i = 1:class_number
        P(:,j,i)=sum(Nei8~=i,2);
    end
P=P*beta;
end
end
