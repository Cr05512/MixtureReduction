function gmr = W2MRA(gmh, Nr)
% gmr = W2MRA(gmh, Nr):
% INPUTS:
% - gmh, a Gaussian mixture,
% - Nr, desired number of components for the reduced mixture (scalar).
% OUTPUTS:
% - gmr, the reduced Gaussian mixture.
% This function implements a greedy reduction algorithm based on the W2
% distance presented in:
% Wasserstein-Distance-Based Gaussian Mixture Reduction, A. Assa, K.N. Plataniotis
assert(~isempty(gmh),'The mixture has to contain at least one element.');
assert(Nr>0,'The number of reduced components has to be greater than zero.');

if numel(gmh)<Nr
    gmr = gmh;
    return
end
gmr = gmh;
Nh = numel(gmh);
if(Nh==Nr)
    return
elseif(Nr==1)
    gmr = W2Barycenter(gmr,100);
    return
end

WMatrix = Inf(Nh,Nh);

for i=1:Nh
    for j=1:Nh
        if i<j
            WMatrix(i,j) = W2(gmr(i),gmr(j));
        end
    end
end

while(numel(gmr)-Nr>0)

    [i,j] = find(WMatrix == min(WMatrix(WMatrix<Inf)),1);
    pdf_merged = W2Barycenter(gmr([i,j]),100);
    gmr(i) = pdf_merged;
    gmr(j) = [];
    
    WMatrix(j,:) = [];
    WMatrix(:,j) = [];
    upd_ind = setdiff(1:numel(gmr),i);
    for j=upd_ind
        dist = W2(pdf_merged,gmr(j));
        if i<j
            WMatrix(i,j) = dist;
        else
            WMatrix(j,i) = dist;
        end
    end

end
    
end

