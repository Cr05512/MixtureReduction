function newMixture = KMeansKLD(gmh,gmr,NKMeansSteps)
%This function operates a K-Means refinement over the reduced mixture in
%order to improve the corresponding means. As distance measure the KLD is
%used.

newMixture = gmr;

KLDMatrix = zeros(length(gmh),length(newMixture));
KLDMatrixPrev = KLDMatrix;
for k=1:NKMeansSteps
    for i=1:length(gmh)
        for j=1:length(newMixture)
            KLDMatrix(i,j) = KLD(gmh(i),newMixture(j));
        end
    end
    
    if norm(KLDMatrix-KLDMatrixPrev)<1e-9
        return
    end

    [~,assignVector] = min(KLDMatrix,[],2);

    for l=1:length(newMixture)
        clusterL = gmh(find(assignVector==l));
        if ~isempty(clusterL)
            newMixture(l) = mpMerge(clusterL);
        else
            newMixture(l) = [];
        end
    end
    
    KLDMatrixPrev = KLDMatrix;
end

end
