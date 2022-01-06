function [gmr,pairs,minCosts] = KitagawaKLD(gmh, Nr)
% gmr = Kitagawa(gmh, Nr):
% INPUTS:
% - gmh, a Gaussian mixture to be reduced,
% - Nr, the desired number of components for the reduced mixture (scalar).
% OUTPUTS:
% - gmr, the reduced Gaussian mixture.
% This function implements the KLD-based algorithm presented in
% "Pearson χ 2 -divergence Approach to Gaussian Mixture Reduction
% and its Application to Gaussian-sum Filter and Smoother", G. Kitagawa
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
    gmr = KLDBarycenter(gmh);
    return
end


BMatrix = Inf(Nh,Nh);
pairs = zeros(Nh-Nr,2);
minCosts = zeros(Nh-Nr,1);

%We first compute the KLD bounds for every merging action

for i=1:Nh
    for j=1:Nh
        if(i<j)
            BMatrix(i,j) = wKLDij(gmr(i),gmr(j));
        end
    end
end

for k=1:Nh-Nr


    %We then find the action with the lowest KLD bound and we merge the
    %corresponding mixture components
    [i,j] = find(BMatrix == min(BMatrix(BMatrix<Inf)),1);
    bar = KLDBarycenter(gmr([i,j]));
    gmr(i) = bar;
    gmr(j) = [];
    pairs(k,:) = [i,j];
    minCosts(k) = BMatrix(i,j);
    BMatrix(j,:) = [];
    BMatrix(:,j) = [];
    upd_ind = setdiff(1:numel(gmr),i);
    for j=upd_ind
        newBound = wKLDij(bar,gmr(j));
        if i<j
            BMatrix(i,j) = newBound;
        else
            BMatrix(j,i) = newBound;
        end
    end

end
    
    
    
end

