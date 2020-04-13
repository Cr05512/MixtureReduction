function gmr = SalmondMRA(gm, Nr)
    
    gmr(1,length(gm)) = wGaussPDF();
    for i=1:length(gm)
        gmr(i).copyComponent(gm(i));
    end
    WMatrix = zeros(length(gmr),length(gmr));
    
    while(length(gmr)-Nr>0)
        %We first compute the KLD bounds for every merging action
        P = overallCovariance(gmr);
        for i=1:length(gmr)
            for j=1:length(gmr)
                if(i<j)
                    WMatrix(i,j) = gmr(i).getWeight()*gmr(j).getWeight()/(gmr(i).getWeight()+gmr(j).getWeight())...
                                    *mahalSquaredDist(gmr(i).getMean(),gmr(j).getMean(),P);
                end
            end
        end
        %We then find the action with the lowest KLD bound and we merge the
        %corresponding mixture components
        [i,j] = find(WMatrix == min(WMatrix(WMatrix>0)));
        pdf_merged = mpMerge(gmr(i),gmr(j));
        gmr(i) = pdf_merged;
        gmr(j) = [];
        WMatrix = WMatrix(1:end-1,1:end-1);
        
    end
    
end

