function [gmr,minCosts] = testAlgo(gmh,Nr)


gmr = gmh;
Nh = numel(gmh);
KBMatrix = Inf(Nh,Nh);
minCosts = zeros(Nh,1);

for k=1:Nh-Nr
    for i=1:numel(gmr)
        for j=1:numel(gmr)
            
            if i<j
                gmr_temp = gmr;

                gmr_temp(i) = FKLDBarycenter(gmr([i;j]));
                gmr_temp(j) = [];
                
                KBMatrix(i,j) = CTD(gmr,gmr_temp,'FKLDij');

                
            end
        end
    end
    k
    minCosts(k+1)=min(KBMatrix(KBMatrix<Inf));
    [i,j] = find(KBMatrix == minCosts(k+1),1);
    bar = FKLDBarycenter(gmr([i,j]));
    gmr(i) = bar;
    gmr(j) = [];
    KBMatrix(j,:) = [];
    KBMatrix(:,j) = [];
    
end

minCosts = minCosts./CTD(gmh,FKLDBarycenter(gmh),'FKLDij');
end

