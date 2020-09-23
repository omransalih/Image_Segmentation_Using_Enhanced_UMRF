function [G S] = GetGraphiM(im)
    %Q = 100;
    %for i=1:100
    %n = im;
    %n = imstack2vectors(NeiX(n));
    %listobj = linked_list(n);
    %Phif = size(im,1) * size(im,2);
    %Df = 256.^2;
    %m = 230;
    %for i = 1 : size(n,1)
    %iter = 0;
    %List = reshape(n,[460,1])
    img = double(im);
    Pr = double(im);
    for r = 2 : size(im,1)-1  
        for c = 2 : size(im,2)-1
            %Pr(r,c) = 1;
            cenei = img(r,c);
            neig1 = img(r-1,c-1); % Upper left.  r = row, c = column.
            if rand < MergFun(cenei, neig1) 
                img(r-1,c-1) = img(r,c);
                Pr(r-1,c-1) = MergFun(cenei, neig1);
            else
                Pr(r-1,c-1) = 0;
            end
            neig2 = img(r-1,c); % Upper middle.  r = row, c = column.
            if rand < MergFun(cenei, neig2) 
                img(r-1,c) = img(r,c);
                Pr(r-1,c) = MergFun(cenei, neig2);
            else
                Pr(r-1,c) = 0;
            end
            neig3 = img(r-1,c+1); % Upper right.  r = row, c = column.
            if rand < MergFun(cenei, neig3) 
                img(r-1,c+1) = img(r,c);
                Pr(r-1,c+1) = MergFun(cenei, neig3);
            else
                Pr(r-1,c+1) = 0;
            end
            neig4 = img(r,c-1); % left.  r = row, c = column.
            if rand < MergFun(cenei, neig4) 
                img(r,c-1) = img(r,c);
                Pr(r,c-1) = MergFun(cenei, neig4);
            else
                Pr(r,c-1) = 0;
            end
            neig5 = img(r,c+1); % right. r = row, c = column.
            if rand < MergFun(cenei, neig5) 
                img(r,c+1) = img(r,c);
                Pr(r,c+1) = MergFun(cenei, neig5);
            else
                Pr(r,c+1) = 0;
            end
            neig6 = img(r+1,c+1); % Lowerleft.  r = row, c = column.
            if rand < MergFun(cenei, neig6) 
                img(r+1,c+1) = img(r,c);
                Pr(r+1,c+1) = MergFun(cenei, neig6);
            else
                Pr(r+1,c+1) = 0;
            end
            neig7 = img(r+1,c); % lower middle.  r = row, c = column.
            if rand < MergFun(cenei, neig7) 
                img(r+1,c) = img(r,c);
                Pr(r+1,c) = MergFun(cenei, neig7);
            else
                Pr(r+1,c) = 0;
            end
            neig8 = img(r+1,c-1); % Lower left.  r = row, c = column.
            if rand < MergFun(cenei, neig8) 
                img(r+1,c-1) = img(r,c);
                Pr(r+1,c-1) = MergFun(cenei, neig8);
            else
                Pr(r+1,c-1) = 0;
            end
        end 
        
%         k = m + i; 
%         List(i) = 0; List(k)=0;
        %listobj.delete(i); listobj.delete(k);
    end
    G = uint8(img);
    S = Pr;
    
%end
    %Q = Q./2;
end