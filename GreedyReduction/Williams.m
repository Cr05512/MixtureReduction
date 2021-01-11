function gmr = Williams(gmh, Nr)
% gmr = Williams(gmh, Nr):
% INPUTS:
% - gmh, a Gaussian mixture,
% - Nr, desired number of components for the reduced mixture (scalar).
% OUTPUTS:
% - gmr, the reduced mixture.
% This function implements the greedy reduction algorithm proposed in
% Williams -> Cost-Function-Based Gaussian Mixture Reduction for Target
% Tracking, J.L. Williams, P.S. Maybeck.

assert(~isempty(gmh),'The mixture has to contain at least one element.');
assert(Nr>0 && numel(gmh)>=Nr,'The reduced mixture must have a positive number of components lower or equal to the starting mixture.');

gmr = gmh;
Nh = numel(gmh);
if(Nh==Nr)
    return
elseif(Nr==1)
    gmr = mpMerge(gmh);
    return
end


ISEMatrix = Inf(Nh,Nh);
%We consider all the merging hypothesis, which are Nk*(Nk-1)/2
%In order to do so we compute a new mixture where a pair of
%components is merged
%Moreover, we compute the Jhh term of the ISE here considering that
%it will stay constant over this iteration
Jhh = selfLikeness(gmr);
for i=1:Nh
    for j=1:Nh
        if i<=j
            gm_temp = gmr;
            if i==j
                gm_temp(i) = [];
                Jhr = crossLikeness(gmr,gm_temp);
                Jrr = selfLikeness(gm_temp);
            else  
                pdf_merged = mpMerge(gm_temp([i,j]));
                gm_temp(i) = pdf_merged;
                gm_temp(j) = [];
                Jhr = crossLikeness(gmr,gm_temp);
                Jrr = selfLikeness(gm_temp);
            end
            ISEMatrix(i,j) = Jhh -2*Jhr + Jrr;
        end
    end
end

while numel(gmr)-Nr>0 %We iterate until the desired number of components is reached

    [i,j] = find(ISEMatrix == min(ISEMatrix(ISEMatrix<Inf)),1);

    if i~=j
        pdf_merged = mpMerge(gmr([i,j]));
        gmr(i) = pdf_merged;
        gmr(j) = [];
        if numel(gmr)-Nr>0
            Jhh = selfLikeness(gmr);
            ISEMatrix(j,:) = [];
            ISEMatrix(:,j) = [];
            upd_ind = setdiff(1:numel(gmr),i);
            for j=upd_ind
                gm_temp = gmr;
                pdf_merged = mpMerge(gm_temp([i,j]));
                gm_temp(i) = pdf_merged;
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
            Jhr = crossLikeness(gmr,gm_temp);
            Jrr = selfLikeness(gm_temp);
            ISEMatrix(i,i) = Jhh - 2*Jhr + Jrr;
        end


    else
        gmr(i) = [];
        if numel(gmr)-Nr>0
            ISEMatrix(i,:) = [];
            ISEMatrix(:,i) = [];
        end
    end

end
        
    
    
end

