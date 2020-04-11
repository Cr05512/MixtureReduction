function gm = KIDivergenceMRA(gm, Nr)

    DKIMatrix = zeros(length(gm),length(gm));
    
    while(length(gm)-Nr>0)
        %We first compute the KI Divergence for every merging action
        for i=1:length(gm)
            for j=1:length(gm)
                if(i<j)
                    DKIMatrix(i,j) = KIDivergence(gm(i),gm(j));
                end
            end
        end
        
        %The KI Divergence is symmetric, but Dki(p1,p1) is not zero. If not
        %considered, the loop will continue forever considering that the
        %algorithm will probably try to merge a component with itself, thus
        %not reducing the mixture
        
        %We then find the action with the lowest KI Divergence and we merge the
        %corresponding mixture components
        [i,j] = find(DKIMatrix == min(DKIMatrix(DKIMatrix>0)));
        pdf_merged = mpMerge(gm(i),gm(j));
        gm(i) = pdf_merged;
        gm(j) = [];
        DKIMatrix = DKIMatrix(1:end-1,1:end-1);
        
    end
    
end

