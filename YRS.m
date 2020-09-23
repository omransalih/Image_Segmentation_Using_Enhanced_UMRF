function [YRSf] = YRS(ms_image, mu, sigma, class_number) 
D = class_number;
n=size(ms_image,1);
YRSf=zeros(n,3,class_number);
alpha = 1.1;
for i= 1: class_number
    mu_i = mu(i,:); 
    sigma_i = sigma(:,:,i);
    Im_i= ms_image - repmat(mu_i,[n,1]);
    YRSf(:,:,i) = sqrt(alpha) ./ ( (2 * pi).^(D/2) * det(sigma_i)) ...
        * exp((Im_i * inv(sigma_i) .* Im_i)./ (-2*alpha)) ;           
end

% n=size(image,1);
% YRSf=zeros(n,class_number);
% alpha = 0.25;
% for i= 1: class_number
%     %Im_i = image(segmentation==i,:);
%     %[K, m] = size(image);
%     mu_i = mu(i,:); 
%     sigma_i = sigma(:,:,i);
%     %Im_i=image - repmat(mu_i,[n,1]);
%     Im_i = image - mu_i(ones(n,1),:);
%     if det(sigma_i)==0
%         det_sigma = 1;
%         inv_sigma = sigma_i ;
%     else
%         det_sigma = det(sigma_i);
%         inv_sigma = inv(sigma_i);
%     end
%     YRSf(:,i)= exp(- 0.5*(Im_i*((1/alpha)*inv_sigma).*Im_i)) + (sqrt(alpha) * log(det_sigma));
% %     cal2 = (Im_i * inv(sigma_i) .* Im_i )./ (- 2 * alpha);
% %     cal3 = exp(cal2(:,i));
% %     cal4 = sqrt(alpha) ./ ( (2 * pi).^(1./2) * det(sigma_i));
% %     YRSf(:,i) = cal4 * cal3; 
% end

end

