function [gmr,pairs,minCosts] = Runnalls(gmh, Nr)
% gmr = Runnalls(gmh, Nr):
% INPUTS:
% - gmh, a Gaussian mixture to be reduced,
% - Nr, the desired number of components for the reduced mixture (scalar).
% OUTPUTS:
% - gmr, the reduced Gaussian mixture.
% This function implements the algorithm presented in
% Kullback-Leibler Approach to Gaussian Mixture Reduction, A.R. Runnals
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
            BMatrix(i,j) = KLDBij(gmr(i),gmr(j));
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
        newBound = KLDBij(bar,gmr(j));
        if i<j
            BMatrix(i,j) = newBound;
        else
            BMatrix(j,i) = newBound;
        end
    end

end
    
    
    
end

