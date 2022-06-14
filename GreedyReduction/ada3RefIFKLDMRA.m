function [gmr,pairs,minCosts,Nr] = ada3RefIFKLDMRA(gmh, I, RTL)
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
    I = 5;
end

gmr = gmh;
Nh = numel(gmh);

bar = FKLDBarycenter(gmh);
maxCost = evalBarycenterFun(gmh,bar,'FKLDij');

BMatrix = Inf(Nh,Nh);
pairs = zeros(Nh-1,2);
minCosts = zeros(Nh,1);
normCumCTD = 0;

%We first compute the KLD bounds for every merging action

for i=1:Nh
    for j=1:Nh
        if(i<j)
            BMatrix(i,j) = FKLDBij(gmr(i),gmr(j));
        end
    end
end
for k=2:Nh


    %We then find the action with the lowest KLD bound and we merge the
    %corresponding mixture components
    [i,j] = find(BMatrix == min(BMatrix(BMatrix<Inf)),1);
    minCosts(k) = BMatrix(i,j)/maxCost;
    normCumCTD = normCumCTD + minCosts(k);
    
    if minCosts(k)>1/(Nh-1+I) || normCumCTD > RTL
        Nr = numel(gmr);
        break;
    end
    bar = FKLDBarycenter(gmr([i,j]));
    gmr(i) = bar;
    gmr(j) = [];
    pairs(k,:) = [i,j];
    
    gmr = CTDRef(gmr,gmh,'FKLDij');

    BMatrix(j,:) = [];
    BMatrix(:,j) = [];
    upd_ind = setdiff(1:numel(gmr),i);
    for j=upd_ind
        newBound = FKLDBij(bar,gmr(j));
        if i<j
            BMatrix(i,j) = newBound;
        else
            BMatrix(j,i) = newBound;
        end
    end

end
    
    
    
end

