function gmr = clusteringCauchySchwarz(gmr,gmh,NSteps)
% gmr = clusteringCauchySchwarz(gmr,gmh,NSteps):
% INPUTS:
% - gmr, gmh, two Gaussian mixture densities,
% - NSteps, number of iterations for the clustering loop (scalar).
% OUTPUTS:
% - gmr, the refined Gaussian mixture.
% This function implements the clustering loop as shown in:
% Gaussian Mixture Reduction via Clustering, D. Schieferdecker, M.F. Huber
% by using the Cauchy-Schwarz divergence as global measure.
d = size(gmh(1).mu,1);
if nargin < 3
    NSteps = 1;
end

assert(~isempty(gmh) && ~isempty(gmr),'The mixtures have to contain at least one element.');

Nh = numel(gmh);
Nr = numel(gmr);
cost_vector = Inf(1,Nr);
Rnk = computeAssignMatrix(gmh,gmr,'KLD');

Jhh = selfLikeness(gmh);

for k=1:NSteps

    for i=1:Nh
        for j=1:Nr
            %1. reassociate site n_i to cluster C_j
            Rnk(i,:) = zeros(1,Nr);
            Rnk(i,j) = 1;
            
            %2. recompute temporary centroids with such association matrix
            gmr = computeClusterCentersGM(gmh,Rnk,'KLD');
            
            
            Jhr = crossLikeness(gmh,gmr);
            Jrr = selfLikeness(gmr);
            cost_vector(j) = -log(Jhr) + 0.5*log(Jhh*Jrr);
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