function [gmr,costs] = randomDFKLMerging(gm, Nr)
Nh = length(gm);
gmr = gm;
maxCost = evalBarycenterFun(gm,FKLDBarycenter(gm),'FKLDij');
costs = zeros(1,Nh-Nr+1);
for k=1:Nh-Nr
    idxs = randperm(length(gmr),2);
    bar = FKLDBarycenter(gmr(idxs));
    costs(k+1) = costs(k) + evalBarycenterFun(gmr(idxs),bar,'FKLDij')/maxCost;

    gmr = [gmr(setdiff(1:length(gmr),idxs));bar];
    

end
end