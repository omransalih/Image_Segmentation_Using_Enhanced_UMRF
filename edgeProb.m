function [Pedge] = edgeProb(image, mu, sigma, class_number) 
n=size(image,1);
Pedge =zeros(n,3,class_number);
D = class_number;
for i= 1: class_number
    mu_i = mu(i,:); 
    sigma_i = sigma(:,:,i);
    Im_i=image - repmat(mu_i,[n,1]);
    %Im_i = image - mu_i(ones(n,1),:);
    %YPSf(:,i)=sum(Im_i*inv(sigma_i).*Im_i,2) + log(det(sigma_i));
    Pedge(:,i) = 1 ./ ( (2 * pi).^(D/2) * det(sigma_i)) ...
        * exp((Im_i * inv(sigma_i) .* Im_i)./ (-2)) ;           
end

end