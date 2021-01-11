function gmr = Wasserstein(gmh, Nr)
% gmr = WassersteinMRA(gmh, Nr):
% INPUTS:
% - gmh, a Gaussian mixture,
% - Nr, desired number of components for the reduced mixture (scalar).
% OUTPUTS:
% - gmr, the reduced Gaussian mixture.
% This function implements a greedy reduction algorithm based on the W2
% distance presented in:
% Wasserstein-Distance-Based Gaussian Mixture Reduction, A. Assa, K.N. Plataniotis
assert(~isempty(gmh),'The mixture has to contain at least one element.');
assert(Nr>0 && numel(gmh)>=Nr,'The reduced mixture must have a positive number of components lower or equal to the starting mixture.');

gmr = gmh;
Nh = numel(gmh);
if(Nh==Nr)
    return
elseif(Nr==1)
    gmr = WassersteinBarycenter(gmr,100);
    return
end

WMatrix = Inf(Nh,Nh);

for i=1:Nh
    for j=1:Nh
        if i<j
            WMatrix(i,j) = Wasserstein2Dist(gmr(i),gmr(j));
        end
    end
end

while(numel(gmr)-Nr>0)

    [i,j] = find(WMatrix == min(WMatrix(WMatrix<Inf)),1);
    pdf_merged = WassersteinBarycenter(gmr([i,j]),100);
    gmr(i) = pdf_merged;
    gmr(j) = [];
    
    WMatrix(j,:) = [];
    WMatrix(:,j) = [];
    upd_ind = setdiff(1:numel(gmr),i);
    for j=upd_ind
        if i<j
            WMatrix(i,j) = Wasserstein2Dist(pdf_merged,gmr(j));
        else
            WMatrix(j,i) = Wasserstein2Dist(pdf_merged,gmr(j));
        end
    end

end
    
end

