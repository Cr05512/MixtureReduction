function gmr = clusteringApproxKLD(gmr,gmh,NSteps)
% gmr = clusteringGMRC(gmr,gmh,costMeas,NSteps):
% INPUTS:
% - gmr, gmh, two Gaussian mixture densities,
% - NSteps, number of iterations for the clustering loop (scalar).
% OUTPUTS:
% - gmr, the refined Gaussian mixture.
% This function implements the clustering loop as shown in:
% Gaussian Mixture Reduction via Clustering, D. Schieferdecker, M.F. Huber

if nargin < 3
    NSteps = 3;
end

assert(~isempty(gmh) && ~isempty(gmr),'The mixtures have to contain at least one element.');

Nh = numel(gmh);
Nr = numel(gmr);
cost_vector = Inf(1,Nr);
Rnk = computeAssignMatrix(gmh,gmr,'KLD');
d = size(gmh(1).mu,1);
SPs = zeros(d,Nh*(2*d+1));
for i=1:Nh
    x = gmh(i).mu;
    P = gmh(i).Sigma;
    [V,D] = svd(P);
    lambda = diag(D);
    SPs(:,((i-1)*(2*d+1)+1):i*(2*d+1)) = [x x+sqrt(lambda).*V  x-sqrt(lambda).*V];
end
sphVals = evalGM(gmh,SPs);
for k=1:NSteps

    for i=1:Nh
        for j=1:Nr
            %1. reassociate site n_i to cluster C_j
            Rnk(i,:) = zeros(1,Nr);
            Rnk(i,j) = 1;
            %2. recompute temporary centroids with such association matrix
            gmr = computeClusterCentersGM(gmh,Rnk,'KLD');
            
            
            
            logVals = log(sphVals./evalGM(gmr,SPs));
            val = 0;
            for m=1:Nh
                val = val + gmh(m).w*sum(logVals(((m-1)*(2*d+1)+1):m*(2*d+1)));
            end
           
            cost_vector(j) = val/(2*d+1);
            %cost_vector(j) = CTD(gmh,gmr,'normL2');
        end
        
        %3. Associate site n_i to C_j for which cost_vector(j) is minimal
        [~,ind] = min(cost_vector);
        Rnk(i,:) = zeros(1,Nr);
        Rnk(i,ind) = 1;
        %4. Recompute the centers
        gmr = computeClusterCentersGM(gmh,Rnk,'KLD');
    end  

end


end