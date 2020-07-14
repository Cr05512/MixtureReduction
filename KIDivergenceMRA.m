function gmr = KIDivergenceMRA(gm, Nr)
    

    gmr = gm;
    DKIMatrix = Inf(length(gmr),length(gmr));
    
    while(length(gmr)-Nr>0)
        %We first compute the KI Divergence for every merging action
        for i=1:length(gmr)
            for j=1:length(gmr)
                if(i<j)
                    DKIMatrix(i,j) = KIDivergence(gmr(i),gmr(j));
                end
            end
        end
        
        %The KI Divergence is symmetric, but Dki(p1,p1) is not zero. If not
        %considered, the loop will continue forever considering that the
        %algorithm will probably try to merge a component with itself, thus
        %not reducing the mixture
        
        %We then find the action with the lowest KI Divergence and we merge the
        %corresponding mixture components
        [i,j] = find(DKIMatrix == min(DKIMatrix(DKIMatrix<Inf)));
        pdf_merged = mpMerge([gmr(i),gmr(j)]);
        gmr(i) = pdf_merged;
        gmr(j) = [];
        DKIMatrix = DKIMatrix(1:end-1,1:end-1);
        
    end
    
end

