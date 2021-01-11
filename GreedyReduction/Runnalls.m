function gmr = Runnalls(gmh, Nr)
% gmr = Runnalls(gmh, Nr):
% INPUTS:
% - gmh, a Gaussian mixture to be reduced,
% - Nr, the desired number of components for the reduced mixture (scalar).
% OUTPUTS:
% - gmr, the reduced Gaussian mixture.
% This function implements the algorithm presented in
% Kullback-Leibler Approach to Gaussian Mixture Reduction, A.R. Runnals
assert(~isempty(gmh),'The mixture has to contain at least one element.');
assert(Nr>0 && numel(gmh)>=Nr,'The reduced mixture must have a positive number of components lower or equal to the starting mixture.');

gmr = gmh;
Nh = numel(gmh);
if(Nh==Nr)
    return
elseif(Nr==1)
    gmr = mpMerge(gmh);
    return
end


BMatrix = Inf(Nh,Nh);

%We first compute the KLD bounds for every merging action

for i=1:Nh
    for j=1:Nh
        if(i<j)
            BMatrix(i,j) = KLDBound(gmr(i),gmr(j));
        end
    end
end

while(numel(gmr)-Nr>0)


    %We then find the action with the lowest KLD bound and we merge the
    %corresponding mixture components
    [i,j] = find(BMatrix == min(BMatrix(BMatrix<Inf)),1);
    pdf_merged = mpMerge(gmr([i,j]));
    gmr(i) = pdf_merged;
    gmr(j) = [];
    
    BMatrix(j,:) = [];
    BMatrix(:,j) = [];
    upd_ind = setdiff(1:numel(gmr),i);
    for j=upd_ind
        if i<j
            BMatrix(i,j) = KLDBound(pdf_merged,gmr(j));
        else
            BMatrix(j,i) = KLDBound(pdf_merged,gmr(j));
        end
    end

end
    
    
    
end

