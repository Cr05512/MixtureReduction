function gm = RunnalsMRA(gm, Nr)

    BMatrix = zeros(length(gm),length(gm));
    
    while(length(gm)-Nr>0)
        %We first compute the KLD bounds for every merging action
        for i=1:length(gm)
            for j=1:length(gm)
                if(i<j)
                    BMatrix(i,j) = KLDBound(gm(i),gm(j));
                end
            end
        end
        %We then find the action with the lowest KLD bound and we merge the
        %corresponding mixture components
        [i,j] = find(BMatrix == min(BMatrix(BMatrix>0)));
        pdf_merged = mpMerge(gm(i),gm(j));
        gm(i) = pdf_merged;
        gm(j) = [];
        %We then shrink both the component vector and bound matrix
        BMatrix = BMatrix(1:end-1,1:end-1);
        
    end
    
end

