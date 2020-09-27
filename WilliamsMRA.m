function gmr = WilliamsMRA(gm, Nr)

%This implementation is particularly inefficient. A lot of calculation is
%redundant and could be avoided
    gmr = gm;
    ISEMatrix = Inf(length(gm),length(gm));
    %We consider all the merging hypothesis, which are Nk*(Nk-1)/2
    %In order to do so we compute a new mixture where a pair of
    %components is merged
    %Moreover, we compute the Jhh term of the ISE here considering that
    %it will stay constant over this iteration
    Jhh = selfLikeness(gmr);
    for i=1:length(gmr)
        for j=1:length(gmr)
            if i<=j
                gm_temp = gmr;
                if i==j
                    gm_temp(i) = [];
                    w_temp = [gm_temp.w]';
                    w_norm = num2cell(w_temp./sum(w_temp));
                    [gm_temp.w] = w_norm{:};
                    Jhr = crossLikeness(gmr,gm_temp);
                    Jrr = selfLikeness(gm_temp);
                else                        
                    gm_temp(i) = mpMerge([gmr(i);gmr(j)]);
                    gm_temp(j) = [];
                    Jhr = crossLikeness(gmr,gm_temp);
                    Jrr = selfLikeness(gm_temp);
                end
                ISEMatrix(i,j) = Jhh -2*Jhr + Jrr;
            end
        end
    end
    
    while length(gmr)-Nr>0 %We iterate until the desired number of components is reached
        
        [i,j] = find(ISEMatrix == min(ISEMatrix(ISEMatrix<Inf)),1);
       
        if i~=j
            gmr(i) = mpMerge([gmr(i),gmr(j)]);
            gmr(j) = [];
            Jhh = selfLikeness(gmr);
            ISEMatrix(j,:) = [];
            ISEMatrix(:,j) = [];
            upd_ind = setdiff(1:length(gmr),i);
            for j=upd_ind
                gm_temp = gmr;
                gm_temp(i) = mpMerge([gmr(i);gmr(j)]);
                gm_temp(j) = [];
                Jhr = crossLikeness(gmr,gm_temp);
                Jrr = selfLikeness(gm_temp);
                if i<j
                    ISEMatrix(i,j) = Jhh -2*Jhr + Jrr;
                else
                    ISEMatrix(j,i) = Jhh -2*Jhr + Jrr;
                end
            end
            gm_temp = gmr;
            gm_temp(i) = [];
            w_temp = [gm_temp.w]';
            w_norm = num2cell(w_temp./sum(w_temp));
            [gm_temp.w] = w_norm{:};
            Jhr = crossLikeness(gmr,gm_temp);
            Jrr = selfLikeness(gm_temp);
            ISEMatrix(i,i) = Jhh - 2*Jhr + Jrr;
            
            
        else
            gmr(i) = [];
            ISEMatrix(i,:) = [];
            ISEMatrix(:,i) = [];
            w_temp = [gmr.w]';
            w_norm = num2cell(w_temp./sum(w_temp));
            [gmr.w] = w_norm{:};
        end
        
    end
        
    
    
end

