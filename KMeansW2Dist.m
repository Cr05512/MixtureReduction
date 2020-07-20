function newMixture = KMeansWas(gmh,gmr,NKMeansSteps)
%This function operates a K-Means refinement over the reduced mixture in
%order to improve the corresponding means. As distance measure the KLD is
%used.

newMixture = gmr;

W2Matrix = zeros(length(gmh),length(newMixture));
W2MatrixPrev = W2Matrix;
for k=1:NKMeansSteps
    for i=1:length(gmh)
        for j=1:length(newMixture)
            W2Matrix(i,j) = Wasserstein2Dist(gmh(i),newMixture(j));
        end
    end
    
    if norm(W2Matrix-W2MatrixPrev)<1e-9
        return
    end

    [~,assignVector] = min(W2Matrix,[],2);

    for l=1:length(newMixture)
        clusterL = gmh(find(assignVector==l));
        if ~isempty(clusterL)
            newMixture(l) = WassersteinBarycenter(clusterL,50);
        else
            newMixture(l) = [];
        end
    end
    
    W2MatrixPrev = W2Matrix;
end

end
