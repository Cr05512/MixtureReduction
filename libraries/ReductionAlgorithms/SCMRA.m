function gmr = SCMRA(gmh,Nr,redStep,cost_meas,lambda,maxiter,I)

gmr = gmh;
% while length(gmr)-Nr>0
%     
%     tempLen = length(gmr) - redStep;
%     
%     if tempLen < Nr
%         redStep = length(gmr) - Nr;
%     end
%     
%     %gmr = pruneKSmallestComp(gmr, redStep);
%     gmr = RunnalsMRA(gmr,length(gmr)-1);
%   
%     %gmr = AWCPruning(gmr,0.99);
%     
%     %gmr = CTDGMRA(gmh,gmr,cost_meas,lambda,1);
%     
% end
gmr = RunnalsMRA(gmh,Nr);

gmr = CTDGMRA(gmh,gmr,cost_meas,lambda,maxiter,I);
gmr = ISEOptimization(gmh,gmr,0.01,5,1);


end

