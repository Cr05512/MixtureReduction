function gmr = SalmondMRA(gm, Nr)
    
    gmr = gm;

    WMatrix = zeros(length(gmr),length(gmr));
    
    while(length(gmr)-Nr>0)
        %We first compute the KLD bounds for every merging action
        pdfMerged = mpMerge(gmr);
        P = pdfMerged.Sigma;
        for i=1:length(gmr)
            for j=1:length(gmr)
                if(i<j)
                    WMatrix(i,j) = gmr(i).w*gmr(j).w/(gmr(i).w+gmr(j).w)...
                                    *mahalSquaredDist(gmr(i).mu,gmr(j).mu,P);
                end
            end
        end
        %We then find the action with the lowest KLD bound and we merge the
        %corresponding mixture components
        [i,j] = find(WMatrix == min(WMatrix(WMatrix>0)),1);
        pdf_merged = mpMerge([gmr(i),gmr(j)]);
        gmr(i) = pdf_merged;
        gmr(j) = [];
        WMatrix = WMatrix(1:end-1,1:end-1);
        
    end
    
end

