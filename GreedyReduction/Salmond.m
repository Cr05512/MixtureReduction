function gmr = Salmond(gmh, Nr)
% gmr = Salmond(gmh, Nr):
% INPUTS:
% - gmh, a Gaussian mixture to be reduced,
% - Nr, the desired number of components for the reduced mixture (scalar).
% OUTPUTS:
% - gmr, the reduced mixture.
% This function implements the joining algorithms presented in
% Mixture reduction algorithms for target tracking in clutter, D.J. Salmond
assert(numel(gmh)>0,'The mixture has to contain at least one element.');
assert(Nr>0 && numel(gmh)>=Nr,'The reduced mixture must have a positive number of components lower or equal to the starting mixture.');

gmr = gmh;
Nh = numel(gmh);
if(Nh==Nr)
    return
elseif(Nr==1)
    gmr = mpMerge(gmh);
    return
end

    

MMatrix = Inf(Nh,Nh);

[~,P] = getMixtureMoments(gmr);

for i=1:Nh
    for j=1:Nh
        if(i<j)
            MMatrix(i,j) = gmr(i).w*gmr(j).w/(gmr(i).w+gmr(j).w)...
                            *mahalSquaredDist(gmr(i).mu,gmr(j).mu,P);
        end
    end
end

while(numel(gmr)-Nr>0)

    [i,j] = find(MMatrix == min(MMatrix(MMatrix<Inf)),1);
    pdf_merged = mpMerge(gmr([i,j]));
    gmr(i) = pdf_merged;
    gmr(j) = [];
    
    MMatrix(j,:) = [];
    MMatrix(:,j) = [];
    [~,P] = getMixtureMoments(gmr);
    upd_ind = setdiff(1:numel(gmr),i);
    for j=upd_ind
        if i<j
            MMatrix(i,j) = pdf_merged.w*gmr(j).w/(pdf_merged.w+gmr(j).w)...
                            *mahalSquaredDist(pdf_merged.mu,gmr(j).mu,P);
        else
            MMatrix(j,i) = pdf_merged.w*gmr(j).w/(pdf_merged.w+gmr(j).w)...
                            *mahalSquaredDist(pdf_merged.mu,gmr(j).mu,P);
        end
    end

end
    
end

