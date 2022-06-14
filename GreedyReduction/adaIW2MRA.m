function [gmr,pairs,minCosts,Nr] = adaIW2MRA(gmh, perc)
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

bar = W2Barycenter(gmh);
maxCost = evalBarycenterFun(gmh,bar,'W2ij');
perc = perc*maxCost;

BMatrix = Inf(Nh,Nh);
pairs = zeros(Nh-1,2);
minCosts = zeros(Nh,1);

%We first compute the KLD bounds for every merging action

for i=1:Nh
    for j=1:Nh
        if(i<j)
            BMatrix(i,j) = W2Bij(gmr(i),gmr(j));
        end
    end
end
for k=2:Nh


    %We then find the action with the lowest KLD bound and we merge the
    %corresponding mixture components
    [i,j] = find(BMatrix == min(BMatrix(BMatrix<Inf)),1);
    bar = W2Barycenter(gmr([i,j]));
    minCosts(k) = minCosts(k-1) + BMatrix(i,j);
    
    if minCosts(k)>perc
        Nr = numel(gmr);
        break;
    end
   
    gmr(i) = bar;
    gmr(j) = [];
    pairs(k,:) = [i,j];
    
    

    BMatrix(j,:) = [];
    BMatrix(:,j) = [];
    upd_ind = setdiff(1:numel(gmr),i);
    for j=upd_ind
        newBound = W2Bij(bar,gmr(j));
        if i<j
            BMatrix(i,j) = newBound;
        else
            BMatrix(j,i) = newBound;
        end
    end

end
minCosts = minCosts./maxCost;
    
    
    
end

