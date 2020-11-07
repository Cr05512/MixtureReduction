function gmr = SCMRA(gmh,Nr,cost_meas,lambda,maxiter)

gmr = gmh;
Nh = length(gmh);
h = 2;
p = 10; %step number to move from Nh to Nr components

for k = 1:p
    gamma = (Nr/Nh)^(1/p);
    Nk = round(gamma^k * Nh);
    gmr = RunnalsMRA(gmr,Nk);
    %gmr = pruneKSmallestComp(gmr,length(gmr)-Nk);
    
    gmr = CTDGMRA(gmh,gmr,cost_meas,lambda,h);
%     %Initial clustering
%     [gmr,Rnk] = GMKMeans(gmh,gmr,'KLD',1);
% 
%     %Clustering loop
%     gmr = clusteringGMRC(gmh,gmr,Rnk,1);
    
    
end

gmr = CTDGMRA(gmh,gmr,cost_meas,lambda,maxiter);


end

