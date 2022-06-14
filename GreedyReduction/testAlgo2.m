function [gmr,minCosts] = testAlgo2(gmh,Nr)


gmr = gmh;
gmr_temp = gmr;
Nh = numel(gmh);
minCosts = zeros(Nh,1);

for k=2:Nh

    idxs = randperm(numel(gmr),2);
    i = idxs(1);
    j = idxs(2);
    bar = FKLDBarycenter(gmr_temp([i,j]));
    gmr_temp(i) = bar;
    gmr_temp(j) = [];
    minCosts(k) = minCosts(k-1) + CTD(gmr,gmr_temp,'FKLDij');
    gmr = gmr_temp;
    
end

minCosts = minCosts./CTD(gmh,FKLDBarycenter(gmh),'FKLDij');
end

