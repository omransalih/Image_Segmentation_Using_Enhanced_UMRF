function [C,m]=covmat(cluster)
[K,n] = size(cluster);
cluster = double(cluster);
if K==1
    C=0;
    m=cluster;
else
    m= sum(cluster,1)/K;
    cluster= cluster - m(ones(K,1),:);
    C=(cluster' * cluster)/(K-1);
    m=m';
end
end