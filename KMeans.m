function gmr = KMeans(gmh,gmr,cost_meas,NKMeansSteps)
%This function operates a K-Means refinement over the reduced mixture in
%order to improve the corresponding means. As distance measure the provided cost measure is
%used.


C = Inf(length(gmh),length(gmr));
Rnk = zeros(size(C));
clusters = cell(length(gmr),1);
J = Inf;
JPrev = J;
for k=1:NKMeansSteps
   
    C = CostMatrix(gmh,gmr,cost_meas);

    [~,assignVector] = min(C,[],2);
    
    for i=1:length(gmh)
        Rnk(i,assignVector(i)) = 1;
    end
    
    J = trace(Rnk'*C);
    
    if abs(J-JPrev)<1e-12
        break;
    else
        JPrev = J;
        Rnk = zeros(size(C));
    end

    
    ind = [];
    
    for l=1:length(gmr)
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
    
    gmr = [clusters{:}]';
end
if k<NKMeansSteps
    disp(horzcat('KMeans converged after ',num2str(k),' steps'));
else
    disp('KMeans did not converge in the maximum given steps');
end

end
