function newMixture = KMeans(gmh,gmr,NKMeansSteps)
%This function operates a K-Means refinement over the reduced mixture in
%order to improve the corresponding means. As distance measure the KLD is
%used.

newMixture = gmr;

nISEMatrix = zeros(length(gmh),length(newMixture));
nISEMatrixPrev = nISEMatrix;
for k=1:NKMeansSteps
    for i=1:length(gmh)
        for j=1:length(newMixture)
            nISEMatrix(i,j) = nISE(newMixture(j),gmh(i));
        end
    end
    
    if norm(nISEMatrix-nISEMatrixPrev)<1e-9
        return
    end

    [~,assignVector] = min(nISEMatrix,[],2);

    for l=1:length(newMixture)
        clusterL = gmh(find(assignVector==l));
        if ~isempty(clusterL)
            newMixture(l) = mpMerge(clusterL);
        else
            newMixture(l) = [];
        end
    end
    
    nISEMatrixPrev = nISEMatrix;
end

end
