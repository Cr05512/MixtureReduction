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
assert(Nr>0,'The number of reduced components has to be greater than zero.');


if numel(gmh)<Nr
    gmr = gmh;
    return
end
gmr = gmh;
Nh = numel(gmh);
if(Nh==Nr)
    return
elseif(Nr==1)
    gmr = mpMerge(gmh);
    return
end



gmr = gmh;
Jhrm = matrixCrossLikeness(gmr,gmr);
Jrrm = matrixSelfLikeness(gmr);
Jrrm_min = Jrrm;

idxs = [0,0];

while numel(gmr)>Nr
    ISEMin = Inf;
    for i=1:numel(gmr)
        for j=1:numel(gmr)
            if i<=j
                Jhrm_temp = Jhrm;
                Jrrm_temp = Jrrm;
                if i==j

                    %Pruning

                    %CrossLikeness
                    Jhrm_temp(:,i) = [];

                    %Reduced SelfLikeness
                    Jrrm_temp(i,:) = [];
                    Jrrm_temp(:,i) = [];

                else
                    %Merging
                    pdfMerged = mpMerge(gmr([i;j]));

                    %CrossLikeness
                    newColhr = matrixCrossLikeness(gmr,pdfMerged);
                    Jhrm_temp(:,i) = newColhr;
                    Jhrm_temp(:,j) = [];

                    %Reduced SelfLikeness

                    tempColrr = matrixCrossLikeness(gmr(setdiff(1:numel(gmr),[i,j])),pdfMerged);
                    newValrr = selfLikeness(pdfMerged);
                    newColrr = zeros(numel(gmr)-1,1);
                    newColrr(setdiff(1:numel(gmr)-1,i)) = tempColrr;
                    newColrr(i) = newValrr;

                    Jrrm_temp(j,:) = [];
                    Jrrm_temp(:,j) = [];
                    Jrrm_temp(i,:) = newColrr;
                    Jrrm_temp(:,i) = newColrr;

                end
                ISECurr = - 2*sum(sum(Jhrm_temp)) + sum(sum(Jrrm_temp));
                if ISECurr < ISEMin
                    ISEMin = ISECurr;
                    idxs(1) = i;
                    idxs(2) = j;
                    Jrrm_min = Jrrm_temp;
                end
           end
        end
    end
    
    Jhrm = Jrrm_min;
    Jrrm = Jrrm_min;
    
    if idxs(1) == idxs(2)
        gmr(idxs(1)) = [];
        gmr = renormalizeWeights(gmr);
        
    else
        gmr(idxs(1)) = mpMerge(gmr(idxs));
        gmr(idxs(2)) = [];
    end
end






end

