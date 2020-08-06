function newMixture = KMeans(gmh,gmr,cost_meas,NKMeansSteps)
%This function operates a K-Means refinement over the reduced mixture in
%order to improve the corresponding means. As distance measure the provided cost measure is
%used.

newMixture = gmr;

C = zeros(length(gmh),length(newMixture));
CPrev = C;
for k=1:NKMeansSteps
   
    C = CostMatrix(gmh,gmr,cost_meas);
    
    if norm(C-CPrev)<1e-9
        return
    end

    [~,assignVector] = min(C,[],2);

    for l=1:length(newMixture)
        clusterL = gmh(find(assignVector==l));
        if ~isempty(clusterL)
            newMixture(l) = mpMerge(clusterL);
        else
            newMixture(l) = [];
        end
    end
    
    CPrev = C;
end

end
