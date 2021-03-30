function gmr = Salmond(gmh, Nr)
% gmr = Salmond(gmh, Nr):
% INPUTS:
% - gmh, a Gaussian mixture to be reduced,
% - Nr, the desired number of components for the reduced mixture (scalar).
% OUTPUTS:
% - gmr, the reduced mixture.
% This function implements the joining algorithms presented in
% "Mixture reduction algorithms for target tracking in clutter", D.J. Salmond
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
    gmr = KLDBarycenter(gmh);
    return
end

    

MMatrix = Inf(Nh,Nh);

[~,P] = getMixtureMoments(gmr);

for i=1:Nh
    for j=1:Nh
        if(i<j)
            MMatrix(i,j) = mMSDij(gmr(i),gmr(j),P);
        end
    end
end

while(numel(gmr)-Nr>0)

    [i,j] = find(MMatrix == min(MMatrix(MMatrix<Inf)),1);
    pdf_merged = KLDBarycenter(gmr([i,j]));
    gmr(i) = pdf_merged;
    gmr(j) = [];
    
    MMatrix(j,:) = [];
    MMatrix(:,j) = [];
    [~,P] = getMixtureMoments(gmr);
    upd_ind = setdiff(1:numel(gmr),i);
    for j=upd_ind
        newM = mMSDij(pdf_merged,gmr(j),P);
        if i<j
            MMatrix(i,j) = newM;
        else
            MMatrix(j,i) = newM;
        end
    end

end
    
end

