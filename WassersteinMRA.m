function gmr = WassersteinMRA(gm, Nr)

    gmr = gm;
    WMatrix = Inf(length(gmr),length(gmr));
    
    while(length(gmr)-Nr>0)
        %We first compute the KLD bounds for every merging action
        for i=1:length(gmr)
            for j=1:length(gmr)
                if i<j
                    WMatrix(i,j) = Wasserstein2Dist(gmr(i),gmr(j));
                end
            end
        end
        %We then find the action with the lowest KLD bound and we merge the
        %corresponding mixture components
        [i,j] = find(WMatrix == min(WMatrix(WMatrix<Inf)),1);
        
        %Alternatively we can compute the barycenter of the desired
        %measures 
        %pdf_merged = WassersteinBarycenter([gmr(i);gmr(j)],100);
        pdf_merged = WassersteinAvg([gmr(i);gmr(j)]);
       
        
        gmr(i) = pdf_merged;
        gmr(j) = [];
        %We then shrink both the component vector and bound matrix
        WMatrix = WMatrix(1:end-1,1:end-1);
        
    end
    
end

