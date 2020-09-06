function newMixture = KMeans(gmh,gmr,cost_meas,NKMeansSteps)
%This function operates a K-Means refinement over the reduced mixture in
%order to improve the corresponding means. As distance measure the provided cost measure is
%used.

newMixture = gmr;

C = zeros(length(gmh),length(newMixture));
CPrev = C;
clusters = cell(length(gmr),1);
for k=1:NKMeansSteps
   
    C = CostMatrix(gmh,gmr,cost_meas);
    
    if norm(C-CPrev)<1e-9
        return
    end

    [~,assignVector] = min(C,[],2);

    
    ind = [];
    
    for l=1:length(newMixture)
        clusters{l} = gmh(find(assignVector==l));
        if ~isempty(clusters{l})
            ind = [ind;l];
        end
    end
    
    clusters = clusters(ind);
    
    for l=1:length(clusters)
        if strcmp(cost_meas,'KLD')
            clusters{l} = mpMerge(clusters{l});
        elseif strcmp(cost_meas,'W2')
            clusters{l} = WassersteinBarycenter(clusters{l},100);
        end
    end
    
    newMixture = [clusters{:}]';
    
    CPrev = C;
end

end
