function gmr = WassersteinMRA(gm, Nr)

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

