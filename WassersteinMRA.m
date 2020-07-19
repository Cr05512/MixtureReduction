function gmr = WassersteinMRA(gm, Nr)

    gmr = gm;
    WMatrix = Inf(length(gmr),length(gmr));
    
    while(length(gmr)-Nr>0)
        %We first compute the KLD bounds for every merging action
        for i=1:length(gmr)
            for j=1:length(gmr)
                if(i<j)
                    WMatrix(i,j) = Wasserstein2Dist(gmr(i),gmr(j));
                end
            end
        end
        %We then find the action with the lowest KLD bound and we merge the
        %corresponding mixture components
        [i,j] = find(WMatrix == min(WMatrix(WMatrix<Inf)),1);
        
        %We now compute the WD-average-minimizing component for the merge
        w_merge = gmr(i).w + gmr(j).w;
        
        wi_tilde = gmr(i).w/w_merge;
        wj_tilde = gmr(j).w/w_merge;
        mu_merge = wi_tilde*gmr(i).mu + wj_tilde*gmr(j).mu;
 
        Sigma_merge = wi_tilde^2*gmr(i).Sigma + wj_tilde^2*gmr(j).Sigma +...
            wi_tilde*wj_tilde*( real(sqrtm(gmr(j).Sigma*gmr(i).Sigma)) + real(sqrtm(gmr(i).Sigma*gmr(j).Sigma))  );
        pdf_merged = struct('w',w_merge,'mu',mu_merge,'Sigma',Sigma_merge);

        %Alternatively we use the barycenter with respect to the W2
        %distance as merging algorithm
%        pdf_merged = WassersteinBarycenter([gmr(i);gmr(j)],50);
%        
        
        
        
      %  pdf_merged = mpMerge([gmr(i);gmr(j)]);
        
        gmr(i) = pdf_merged;
        gmr(j) = [];
        %We then shrink both the component vector and bound matrix
        WMatrix = WMatrix(1:end-1,1:end-1);
        
    end
    
end

