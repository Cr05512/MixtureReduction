function gmr = clusteringGMRC(gmh,gmr,NSteps)
% gmr = clusteringGMRC(gmh,gmr,NSteps):
% INPUTS:
% - gmh, gmr, two Gaussian mixtures
% - NSteps, number of iterations for the clustering loop
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
            cost_vector(j) = normL2Gauss(gmh(i),gmr(j));
        end
        
        [~,ind] = min(cost_vector);
        gmr(ind) = mpMerge([gmh(i),gmr(ind)]);
    end  
end

w_temp = num2cell([gmr.w]'./sum([gmr.w]));
[gmr.w] = w_temp{:};

end