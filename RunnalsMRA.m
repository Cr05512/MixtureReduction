function gmr = RunnalsMRA(gm, Nr)
% gmr = RunnalsMRA(gm, Nr):
% INPUTS:
% - gm, a Gaussian mixture to be reduced,
% - Nr, the desired number of components for the reduced mixture.
% OUTPUTS:
% - gmr, the reduced mixture.
% This function implements the Runnals' algorithm.
assert(~isempty(gm),'The mixture has to contain at least one element.');
assert(Nr>0 && length(gm)>=Nr,'The reduced mixture must have a positive number of components lower or equal to the starting mixture.');

    gmr = gm;
    BMatrix = Inf(length(gmr),length(gmr));
    
    %We first compute the KLD bounds for every merging action
    
    for i=1:length(gmr)
        for j=1:length(gmr)
            if(i<j)
                BMatrix(i,j) = KLDBound(gmr(i),gmr(j));
            end
        end
    end
    
    while(length(gmr)-Nr>0)
        
       
        %We then find the action with the lowest KLD bound and we merge the
        %corresponding mixture components
        [i,j] = find(BMatrix == min(BMatrix(BMatrix<Inf)),1);
        pdf_merged = mpMerge([gmr(i),gmr(j)]);
        gmr(i) = pdf_merged;
        gmr(j) = [];
        BMatrix(j,:) = [];
        BMatrix(:,j) = [];
        upd_ind = setdiff(1:length(gmr),i);
        for j=upd_ind
            if i<j
                BMatrix(i,j) = KLDBound(pdf_merged,gmr(j));
            else
                BMatrix(j,i) = KLDBound(pdf_merged,gmr(j));
            end
        end
        
    end
    
    
    
end

