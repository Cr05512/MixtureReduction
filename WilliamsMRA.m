function gmr = WilliamsMRA(gm, Nr)

%This implementation is particularly inefficient. A lot of calculation is
%redundand and could be avoided
%Unlike the other algorithms, this is the only one following a global
%approach, that is by considering the full mixture in the distance
%calculation instead of single pairs of components. This allows even the
%pruning, and not only merging

    gmr = gm;
    ISEMatrix = zeros(length(gm),length(gm));
        
    while(length(gmr)-Nr>0)
        %The Jhh is something to be calculated once per reduction step, so
        %we compute it here once for all
        Jhh = selfLikeness(gmr);
        gm_temp = gmr;
        for i=1:length(gmr)
            gm_temp(i) = [];
            Jhr = crossLikeness(gmr,gm_temp);
            Jrr = selfLikeness(gm_temp);
            ISEMatrix(i,i) = Jhh - 2*Jhr + Jrr;
            gm_temp = gmr;
            
            for j=1:length(gmr)
                if(i<j)
                    gm_temp(i) = mpMerge([gm_temp(i),gm_temp(j)]);
                    gm_temp(j) = [];
                    Jhr = crossLikeness(gmr,gm_temp);
                    Jrr = selfLikeness(gm_temp);
                    ISEMatrix(i,j) = Jhh - 2*Jhr + Jrr;
                    gm_temp = gmr;
                end
            end
        end
        [i,j] = find(ISEMatrix == min(ISEMatrix(ISEMatrix>0)));

        if i~=j
            gmr(i) = mpMerge([gmr(i),gmr(j)]);
            gmr(j) = [];
        else
            gmr(i) = [];
        end
        ISEMatrix = ISEMatrix(1:end-1,1:end-1);
        
    end
    
end

