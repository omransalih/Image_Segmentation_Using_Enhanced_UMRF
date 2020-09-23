function [G List] = GetGraph(initial_Graph, im )
    Q = 100;
%for i=1:100
    n = initial_Graph;
    %listobj = linked_list(n);
    Phif = size(im,1) * size(im,2);
    Df = 256.^2;
    m = 230;
    %for i = 1 : size(n,1)
    iter = 0;
    List = reshape(n,[460,1]);
    for i = 1 : m  
        ER_a = n(i,1);
        ER_b = n(i,2);
        PhiRa = size(ER_a,1);
        PhiRb = size(ER_b,1);
        Lambda = (Df/(2*Q)) * ((log(Phif.^2)/PhiRa) + (log(Phif.^2)/PhiRb));
        Alpha  = exp(-(ER_a - ER_b).^2./Lambda);
        if rand < Alpha 
            n(i,1) = n(i,2);
        end
        k = m + i; 
        List(i) = 0; List(k)=0;
        %listobj.delete(i); listobj.delete(k);
    end
    G = n;
    
%end
    %Q = Q./2;
end
    
%     % Compute Region adjacency graph
% [n e] = imRAG(wat);
% 
% % diplay RAG with surimpression
% hold on;
% for i = 1:size(e, 1)
%     plot(n(e(i,:), 1), n(e(i,:), 2), 'linewidth', 2, 'color', 'g');
% end
% plot(n(:,1), n(:,2), 'bo');