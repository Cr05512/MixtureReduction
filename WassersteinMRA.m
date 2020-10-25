function gmr = WassersteinMRA(gm, Nr)
% gmr = WassersteinMRA(gm, Nr):
% INPUTS:
% - gm, a Gaussian mixture,
% - Nr, desired number of components for the reduced mixture.
% OUTPUTS:
% - gmr, the reduced Gaussian mixture.
% This function implements a greedy reduction algorithm based on the W2
% distance presented in:
% Wasserstein-Distance-Based Gaussian Mixture Reduction, A. Assa, K.N. Plataniotis
assert(~isempty(gm),'The mixture has to contain at least one element.');
assert(Nr>0 && length(gm)>=Nr,'The reduced mixture must have a positive number of components lower or equal to the starting mixture.');

    gmr = gm;
    WMatrix = Inf(length(gmr),length(gmr));
    for i=1:length(gmr)
        for j=1:length(gmr)
            if i<j
                WMatrix(i,j) = Wasserstein2Dist(gmr(i),gmr(j));
            end
        end
    end
    
    while(length(gmr)-Nr>0)
        
        [i,j] = find(WMatrix == min(WMatrix(WMatrix<Inf)),1);
        pdf_merged = WassersteinAvg([gmr(i);gmr(j)]);
        gmr(i) = pdf_merged;
        gmr(j) = [];
        WMatrix(j,:) = [];
        WMatrix(:,j) = [];
        upd_ind = setdiff(1:length(gmr),i);
        for j=upd_ind
            if i<j
                WMatrix(i,j) = Wasserstein2Dist(pdf_merged,gmr(j));
            else
                WMatrix(j,i) = Wasserstein2Dist(pdf_merged,gmr(j));
            end
        end
        
    end
    
end

