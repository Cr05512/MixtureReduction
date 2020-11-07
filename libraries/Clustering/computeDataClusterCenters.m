function centers = computeDataClusterCenters(samples,Rnk)
% centers = computeDataClusterCenters(samples,Rnk):
% INPUTS:
% - samples, sample points,
% - Rnk, association/membership matrix.
% OUTPUTS:
% centers, a matrix whose colums are the cluster centroids.
% This function update the cluster centers according to the membership
% matrix Rnk.

assert(~isempty(samples),'The number of samples has to be greater than zero.');
assert(size(Rnk,1)==size(samples,2),'Dimension mismatch between number of samples and membership matrix rows.');

d = size(samples,1);
K = size(Rnk,2);
clusters = cell(K,1);
centers = zeros(d,K);

ind = [];
for i=1:K
    clusters{i} = samples(:,logical(Rnk(:,i))); %We generate the clusters according to the association matrix
    if ~isempty(clusters{i})
        ind = [ind;i];
    end
end

clusters = clusters(ind);
centers = centers(:,ind);
for i=1:length(clusters) %We use length(clusters) because it can be smaller than Nr
    centers(:,i) = sum(clusters{i},2)./size(clusters{i},2);
end

end

