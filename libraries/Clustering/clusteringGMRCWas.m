function gmr = clusteringGMRCWas(gmh,gmr,Rnk,NSteps)
% gmr = clusteringGMRC(gmh,gmr,NSteps):
% INPUTS:
% - gmh, gmr, two Gaussian mixtures,
% - Rnk, initial clustering association matrix,
% - NSteps, number of iterations for the clustering loop.
% OUTPUTS:
% - gmr, the refined mixture.
% This function implements the clustering loop as shown in:
% Gaussian Mixture Reduction via Clustering, D. Schieferdecker, M.F. Huber

assert(~isempty(gmh) && ~isempty(gmr),'The mixtures have to contain at least one element.');

Nh = length(gmh);
Nr = length(gmr);
cost_vector = Inf(1,Nr);
for k=1:NSteps

    for i=1:Nh
        for j=1:Nr
            %1. reassociate site n_i to cluster C_j
            Rnk(i,:) = zeros(1,Nr);
            Rnk(i,j) = 1;
            %2. recompute temporary centroids with such association matrix
            gmr = computeClusterCentersGM(gmh,Rnk,'W2');
            cost_vector(j) = CTD(gmh,gmr,'W2'); %we compute the cost of such association
            %cost_vector(j) = CTD(gmh,gmr,'normL2');
        end
        
        %3. Associate site n_i to C_j for which cost_vector(j) is minimal
        [~,ind] = min(cost_vector);
        Rnk(i,:) = zeros(1,Nr);
        Rnk(i,ind) = 1;
        %4. Recompute the centers
        gmr = computeClusterCentersGM(gmh,Rnk,'W2');
    end  

end


end