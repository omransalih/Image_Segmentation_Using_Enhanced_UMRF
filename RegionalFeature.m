function RegFeat = RegionalFeature(Ims, RatArea)

% use the help of a bigger matrix
%A = rgb2gray(Ims);
A = Ims;
[width height bands] = size(A);
B=nan(width +2, height + 2, bands);
B(2:end-1,2:end-1,:)=A;
% pre-define memory for result
result = 0*A;
% calculate!
for k = 1 : 3
    for i=2:size(A,1)+1,
        for j=2:size(A,2)+1,
            tmp=B(i-1:i+1,j-1:j+1,k);
            tmp = tmp(:);  tmp(5)=[];
            tmp = tmp .* (1 + log(tmp));
            result(i-1,j-1,k)= sum(tmp(~isnan(tmp)))./8;
        end
    end
end
RatArea = RatArea .* (1 - log(RatArea)); 
RegFeat = RatArea + result ; 

end 