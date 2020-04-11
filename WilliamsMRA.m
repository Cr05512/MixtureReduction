function gm = WilliamsMRA(gm, Nr)

%This implementation is particularly inefficient. A lot of calculation is
%redundand and could be avoided
%Unlike the other algorithms, this is the only one following a global
%approach, that is by considering the full mixture in the distance
%calculation instead of single pairs of components. This allows even the
%pruning, and not only merging

    ISEMatrix = zeros(length(gm),length(gm));
        
    while(length(gm)-Nr>0)
        %The Jhh is something to be calculated once per reduction step, so
        %we compute it here once for all
        Jhh = selfLikeness(gm);
        gm_r = gm;
        for i=1:length(gm)
            gm_r(i) = [];
            Jhr = crossLikeness(gm,gm_r);
            Jrr = selfLikeness(gm_r);
            ISEMatrix(i,i) = Jhh - 2*Jhr + Jrr;
            gm_r = gm;
            
            for j=1:length(gm)
                if(i<j)
                    gm_r(i) = mpMerge(gm_r(i),gm_r(j));
                    gm_r(j) = [];
                    Jhr = crossLikeness(gm,gm_r);
                    Jrr = selfLikeness(gm_r);
                    ISEMatrix(i,j) = Jhh - 2*Jhr + Jrr;
                    gm_r = gm;
                end
            end
        end
        [i,j] = find(ISEMatrix == min(ISEMatrix(ISEMatrix>0)));

        if i~=j
            gm(i) = mpMerge(gm(i),gm(j));
            gm(j) = [];
        else
            gm(i) = [];
        end
        ISEMatrix = ISEMatrix(1:end-1,1:end-1);
        
    end
    
end

