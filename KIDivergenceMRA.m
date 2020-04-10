function gm_r = KIDivergenceMRA(gm, Nr)

    gm_r = gm;
    DKIMatrix = zeros(length(gm_r),length(gm_r));
    
    while(length(gm_r)-Nr>0)
        %We first compute the KI Divergence for every merging action
        for i=1:length(gm_r)
            for j=1:length(gm_r)
                if(i<j)
                    DKIMatrix(i,j) = KIDivergence(gm_r(i),gm_r(j));
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
        pdf_merged = mpMerge(gm_r(i),gm_r(j));
        gm_r([i,j]) = [];
        %We then shrink both the component vector and bound matrix
        gm_r = [gm_r(1:length(gm_r) < i), pdf_merged, gm_r(1:length(gm_r) >= i)];
        DKIMatrix = zeros(length(gm_r),length(gm_r));
        
    end
    
end

