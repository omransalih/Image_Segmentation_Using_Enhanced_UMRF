function [Ims RatArea Kms] = Ms2(I,bandwidth)

%% color + spatial (option: bandwidth)
I = im2double(I);
[x,y] = meshgrid(1:size(I,2),1:size(I,1)); L = [y(:)/max(y(:)),x(:)/max(x(:))]; % Spatial Features
C = reshape(I,size(I,1)*size(I,2),3); X = [C,L]; Y = [C, L];                               % Color & Spatial Features
%% MeanShift Segmentation
[clustCent,point2cluster,clustMembsCell] = MeanShiftCluster(X',bandwidth); 
SegArea = zeros(length(clustMembsCell),1);
OrigArea = size(I,1)*size(I,2); 
% MeanShiftCluster
for i = 1:length(clustMembsCell)                                                % Replace Image Colors With Cluster Centers
X(clustMembsCell{i},:) = repmat(clustCent(:,i)',size(clustMembsCell{i},2),1);
SegArea(i) = length(find(point2cluster == i));
Y(clustMembsCell{i},:) = SegArea(i)/OrigArea; 
end
% Segmented Image
RatArea = reshape(Y(:,1:3),size(I,1),size(I,2),3);
Ims = reshape(X(:,1:3),size(I,1),size(I,2),3);  
                              
Kms = length(clustMembsCell);

end