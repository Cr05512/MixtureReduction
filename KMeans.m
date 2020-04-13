function newMixture = KMeans(gmh,gmr,NKMeansSteps)
%This function operates a K-Means refinement over the reduced mixture in
%order to improve the corresponding means. As distance measure the KLD is
%used.
newMixture(1,length(gmr)) = wGaussPDF();
for i=1:length(newMixture)
    newMixture(i).copyComponent(gmr(i));
end

KLDMatrix = zeros(length(gmh),length(newMixture));
KLDMatrixPrev = KLDMatrix;
for k=1:NKMeansSteps
    for i=1:length(gmh)
        for j=1:length(newMixture)
            KLDMatrix(i,j) = KLD(newMixture(j),gmh(i));
        end
    end
    
    if norm(KLDMatrix-KLDMatrixPrev)<1e-9
        break;
    end

    [~,assignVector] = min(KLDMatrix,[],2);

    for l=1:length(newMixture)
        clusterL = gmh(find(assignVector==l));
        newMixture(l) = mpMerge(clusterL);
    end
    
    KLDMatrixPrev = KLDMatrix;
end

end
