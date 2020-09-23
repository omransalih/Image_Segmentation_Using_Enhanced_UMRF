function P = gibs(image,class_number , beta)
    image = double(image);
    [width height bands] = size(image);
    n = width * height;
    %P = zeros(n,class_number, bands);
%for i = 1 : bands 
    imagevec = imstack2vectors(image);
    [Imlabel_orig, c] = kmeans(imagevec,class_number);
    
    C = double(bsxfun(@eq, Imlabel_orig, permute(1:class_number, [1 3 2])));
    C(C == 0) = -beta;
    C(C == 1) = beta;

    mask = zeros(3,3); mask(2,2) = 1;
    Cpad = convn(C, mask);
    Cpad(Cpad == 0) = - beta;

    mask2 = ones(3,3); mask2(2,2) = 0;
    out = convn(Cpad, mask2, 'valid');
    
    Z = sum(exp(- out),3); %// out is U in my code
    P(:,:) = bsxfun(@rdivide, exp(-out), Z);
%end
end
