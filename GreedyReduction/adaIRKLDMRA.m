function [gmr,pairs,minCosts,Nr] = adaIRKLDMRA(gmh, perc)
% gmr = Runnalls(gmh, Nr):
% INPUTS:
% - gmh, a Gaussian mixture to be reduced,
% - Nr, the desired number of components for the reduced mixture (scalar).
% OUTPUTS:
% - gmr, the reduced Gaussian mixture.
% This function implements the algorithm presented in
% Kullback-Leibler Approach to Gaussian Mixture Reduction, A.R. Runnals
assert(~isempty(gmh),'The mixture has to contain at least one element.');

if nargin < 2
    perc = 0.2;
end

gmr = gmh;
Nh = numel(gmh);

bar = RKLDBarycenter(gmh);
maxCost = evalBarycenterFun(gmh,bar,'RKLDij');

BMatrix = Inf(Nh,Nh);
pairs = zeros(Nh-1,2);
minCosts = zeros(Nh,1);

%We first compute the KLD bounds for every merging action

for i=1:Nh
    for j=1:Nh
        if(i<j)
            BMatrix(i,j) = RKLDBij(gmr(i),gmr(j));
        end
    end
end
for k=1:Nh-1


    %We then find the action with the lowest KLD bound and we merge the
    %corresponding mixture components
    [i,j] = find(BMatrix == min(BMatrix(BMatrix<Inf)),1);
    minCosts(k+1) = minCosts(k) + BMatrix(i,j)/maxCost;
    
    if minCosts(k+1)>perc
        Nr = numel(gmr);
        break;
    end
    bar = RKLDBarycenter(gmr([i,j]));
    gmr(i) = bar;
    gmr(j) = [];
    pairs(k,:) = [i,j];
    
    

    BMatrix(j,:) = [];
    BMatrix(:,j) = [];
    upd_ind = setdiff(1:numel(gmr),i);
    for j=upd_ind
        newBound = RKLDBij(bar,gmr(j));
        if i<j
            BMatrix(i,j) = newBound;
        else
            BMatrix(j,i) = newBound;
        end
    end

end
    
    
    
end

