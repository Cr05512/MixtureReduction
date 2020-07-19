function gmr = WilliamsMRA(gm, Nr)

%This implementation is particularly inefficient. A lot of calculation is
%redundant and could be avoided
    gmr = gm;
    ISEMatrix = Inf(length(gm),length(gm));
    
    while length(gmr)-Nr>0 %We iterate until the desired number of components is reached
        %We consider all the merging hypothesis, which are Nk*(Nk-1)/2
        %In order to do so we compute a new mixture where a pair of
        %components is merged
        %Moreover, we compute the Jhh term of the ISE here considering that
        %it will stay constant over this iteration
        Jhh = selfLikeness(gmr);
        gm_temp = gmr;
        for i=1:length(gmr)
            for j=1:length(gmr)
                if i<j
                    p_merged = mpMerge([gmr(i);gmr(j)]);
                    gm_temp(i) = p_merged;
                    gm_temp(j) = [];
                    %We evaluate the ISE for this reduced mixture
                    Jhr = crossLikeness(gmr,gm_temp);
                    Jrr = selfLikeness(gm_temp);
                    ISEMatrix(i,j) = Jhh -2*Jhr + Jrr;
                end
                gm_temp = gmr;
            end
        end

        %We now evalute the pruning hypotheses
        for i=1:length(gmr)
            gm_temp(i) = [];
            w_temp = [gm_temp.w]';
            w_norm = num2cell(w_temp./sum(w_temp));
            [gm_temp.w] = w_norm{:};
            Jhr = crossLikeness(gmr,gm_temp);
            Jrr = selfLikeness(gm_temp);
            ISEMatrix(i,i) = Jhh -2*Jhr + Jrr;
            gm_temp = gmr;
        end
        
        [i,j] = find(ISEMatrix == min(ISEMatrix(ISEMatrix<Inf)),1);
       
        if i~=j
            gmr(i) = mpMerge([gmr(i),gmr(j)]);
            gmr(j) = [];
        else
            gmr(i) = [];
            w_temp = [gmr.w]';
            w_norm = num2cell(w_temp./sum(w_temp));
            [gmr.w] = w_norm{:};
        end
        
        ISEMatrix = ISEMatrix(1:end-1,1:end-1);
        
        
    end
        
    
    
end

