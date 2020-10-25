function gmr = SalmondMRA(gm, Nr)
% gmr = SalmondMRA(gm, Nr):
% INPUTS:
% - gm, a Gaussian mixture to be reduced,
% - Nr, the desired number of components for the reduced mixture.
% OUTPUTS:
% - gmr, the reduced mixture.
% This function implements the joining algorithms presented in
% Mixture reduction algorithms for target tracking in clutter, D.J. Salmond
assert(~isempty(gm),'The mixture has to contain at least one element.');
assert(Nr>0 && length(gm)>=Nr,'The reduced mixture must have a positive number of components lower or equal to the starting mixture.');

    
    gmr = gm;
    MMatrix = Inf(length(gmr),length(gmr));
    
    P = mpMerge(gmr).Sigma;
    
    for i=1:length(gmr)
        for j=1:length(gmr)
            if(i<j)
                MMatrix(i,j) = gmr(i).w*gmr(j).w/(gmr(i).w+gmr(j).w)...
                                *mahalSquaredDist(gmr(i).mu,gmr(j).mu,P);
            end
        end
    end
    
    while(length(gmr)-Nr>0)
        
        [i,j] = find(MMatrix == min(MMatrix(MMatrix<Inf)),1);
        pdf_merged = mpMerge([gmr(i),gmr(j)]);
        gmr(i) = pdf_merged;
        gmr(j) = [];
        MMatrix(j,:) = [];
        MMatrix(:,j) = [];
        P = mpMerge(gmr).Sigma;
        upd_ind = setdiff(1:length(gmr),i);
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

