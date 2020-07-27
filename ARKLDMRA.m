function gmr = ARKLDMRA(gm, Nr)

    gmr = gm;
    ARKLDMatrix = Inf(length(gmr),length(gmr));
    
    while(length(gmr)-Nr>0)
        %We first compute the KLD bounds for every merging action
        for i=1:length(gmr)
            for j=1:length(gmr)
                if(i<=j)
                    ARKLDMatrix(i,j) = computeARKLD(gmr,i,j);
                end
            end
        end
        %We then find the action with the lowest KLD bound and we merge the
        %corresponding mixture components
        
        [i,j] = find(ARKLDMatrix == min(ARKLDMatrix(ARKLDMatrix<Inf)),1);
        if i~=j
            gmr(i) = mpMerge([gmr(i),gmr(j)]);
            gmr(j) = [];
        else
            gmr(i) = [];
            w_temp = [gmr.w]';
            w_norm = num2cell(w_temp./sum(w_temp));
            [gmr.w] = w_norm{:};
        end
        
        ARKLDMatrix = ARKLDMatrix(1:end-1,1:end-1);
        
    end
    
end

