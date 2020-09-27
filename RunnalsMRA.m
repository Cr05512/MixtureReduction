function gmr = RunnalsMRA(gm, Nr)

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

