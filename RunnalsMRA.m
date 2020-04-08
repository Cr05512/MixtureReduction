function gm_r = RunnalsMRA(gm, Nr)

    gm_r = gm;
    %We first compute the KLD bounds for every merging action
    BMatrix = zeros(length(gm_r),length(gm_r));
    while(length(gm_r)-Nr>0)
        
        for i=1:length(gm_r)
            for j=1:length(gm_r)
                if(i<j)
                    BMatrix(i,j) = KLDBound(gm_r(i),gm_r(j));
                end
            end
        end
        [i,j] = find(BMatrix == min(BMatrix(BMatrix>0)));
        pdf_merged = mpMerge(gm_r(i),gm_r(j));
        gm_r([i,j]) = [];
        gm_r = [gm_r(1:length(gm_r) < i), pdf_merged, gm_r(1:length(gm_r) >= i)];
        BMatrix = zeros(length(gm_r),length(gm_r));
        
    end
    
end

