function gmr = clusteringGMRCISE(gmr,gmh,NSteps)
% gmr = clusteringGMRCISE(gmr,gmh,costMeas,NSteps):
% INPUTS:
% - gmr, gmh, two Gaussian mixture densities,
% - NSteps, number of iterations for the clustering loop (scalar).
% OUTPUTS:
% - gmr, the refined Gaussian mixture.
% This function implements the clustering loop as shown in:
% Gaussian Mixture Reduction via Clustering, D. Schieferdecker, M.F. Huber

if nargin < 3
    NSteps = 1;
end

assert(~isempty(gmh) && ~isempty(gmr),'The mixtures have to contain at least one element.');

Nh = numel(gmh);
Nr = numel(gmr);
cost_vector = Inf(1,Nr);
Jhh = selfLikeness(gmh);
Rnk = computeAssignMatrix(gmh,gmr,'L2ij');

for k=1:NSteps

    for i=1:Nh
        for j=1:Nr
            %1. reassociate site n_i to cluster C_j
            Rnk(i,:) = zeros(1,Nr);
            Rnk(i,j) = 1;
            %2. recompute temporary centroids with such association matrix
            gmr = computeClusterCentersGM(gmh,Rnk,'L2ij');
            Jhr = crossLikeness(gmh,gmr);
            Jrr = selfLikeness(gmr);
            cost_vector(j) = (Jhh - 2*Jhr + Jrr)/(Jhh + Jrr); %we compute the cost of such association
            %cost_vector(j) = CTD(gmh,gmr,'normL2');
        end
        
        %3. Associate site n_i to C_j for which cost_vector(j) is minimal
        [~,ind] = min(cost_vector);
        Rnk(i,:) = zeros(1,Nr);
        Rnk(i,ind) = 1;
        %4. Recompute the centers
        gmr = computeClusterCentersGM(gmh,Rnk,'L2ij');
    end  

end


end