function gm = SalmondMRA(gm, Nr)

    WMatrix = zeros(length(gm),length(gm));
    
    while(length(gm)-Nr>0)
        %We first compute the KLD bounds for every merging action
        P = overallCovariance(gm);
        for i=1:length(gm)
            for j=1:length(gm)
                if(i<j)
                    WMatrix(i,j) = gm(i).getWeight()*gm(j).getWeight()/(gm(i).getWeight()+gm(j).getWeight())...
                                    *mahalSquaredDist(gm(i).getMean(),gm(j).getMean(),P);
                end
            end
        end
        %We then find the action with the lowest KLD bound and we merge the
        %corresponding mixture components
        [i,j] = find(WMatrix == min(WMatrix(WMatrix>0)));
        pdf_merged = mpMerge(gm(i),gm(j));
        gm(i) = pdf_merged;
        gm(j) = [];
        WMatrix = WMatrix(1:end-1,1:end-1);
        
    end
    
end

