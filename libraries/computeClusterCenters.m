function gmr = computeClusterCenters(gmh,Rnk,cost_meas)
% gmr = computeClusterCenters(gmh,Rnk):
% INPUTS:
% - gmh, a Gaussian mixture (the sites),
% - Rnk, cluster association matrix,
% - cost_meas, cost function used for the association.
% OUTPUTS:
% - gmr, the cluster centers/centroids.
% This function computes the cluster centers in the case of Gaussian
% clustering, given the association matrix Rnk and the sites gmh.

Nr = size(Rnk,2);
clusters = cell(Nr,1);

ind = [];
for i=1:Nr
    clusters{i} = gmh(logical(Rnk(:,i))); %We generate the clusters according to the association matrix
    if ~isempty(clusters{i})
        ind = [ind;i];
    end
end

clusters = clusters(ind);
for i=1:length(clusters) %We use length(clusters) because it can be smaller than Nr
    if strcmpi(cost_meas,'W2')
        clusters{i} = WassersteinBarycenter(clusters{i},100);
    else
        clusters{i} = mpMerge(clusters{i});
    end
end

gmr = [clusters{:}];

end

