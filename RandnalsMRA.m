function gmr = RandnalsMRA(gm, Nr, gamma)

    gmr = gm;
    BMatrix = Inf(length(gmr),length(gmr));
    
    while(length(gmr)-Nr>0)
        %We first compute the KLD bounds for every merging action
        for i=1:length(gmr)
            for j=1:length(gmr)
                if(i<j)
                    BMatrix(i,j) = KLDBound(gmr(i),gmr(j));
                end
            end
        end
        
        
        costs = mink(reshape(BMatrix,1,[]),20);
        keep = [costs(1)];
        for i=2:20
            if costs(i) <=costs(1)*(1+gamma)
                keep = [keep;costs(i)];
            end
        end
        
        
        %We then find the action with the lowest KLD bound and we merge the
        %corresponding mixture components
        
        [i,j] = find(BMatrix == costs(randi([1 length(keep)])));
        pdf_merged = mpMerge([gmr(i),gmr(j)]);
        gmr(i) = pdf_merged;
        gmr(j) = [];
        %We then shrink both the component vector and bound matrix
        BMatrix = BMatrix(1:end-1,1:end-1);
        
    end
    
    
    
end

