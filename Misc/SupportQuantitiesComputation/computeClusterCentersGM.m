function gmr = computeClusterCentersGM(gmh,Rnk,costMeas)
% gmr = computeClusterCentersGM(gmh,Rnk,costMeas):
% INPUTS:
% - gmh, a Gaussian mixture,
% - Rnk, cluster association matrix (Nh x Nr binary matrix),
% - costMeas, cost function used for the association (char array).
% OUTPUTS:
% - gmr, the cluster centers/centroids (Gaussian Mixture).
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
    if strcmpi(costMeas,'W2ij')
        clusters{i} = W2Barycenter(clusters{i},100);
    elseif strcmpi(costMeas,'L2ij')
        clusters{i} = ISEBSGA(clusters{i});
    elseif strcmpi(costMeas,'NL2ij')
        clusters{i} = NISEBSGA(clusters{i});
    elseif strcmpi(costMeas,'CSij')
        clusters{i} = CSDBarycenter(clusters{i});
    else
        clusters{i} = KLDBarycenter(clusters{i});
    end
end

gmr = [clusters{:}]';
end

