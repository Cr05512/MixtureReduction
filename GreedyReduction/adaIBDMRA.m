function [gmr,pairs,minCosts,Nr] = adaIBDMRA(gmh, alpha, RTL, maxiter, tol)
% gmr = Runnalls(gmh, Nr):
% INPUTS:
% - gmh, a Gaussian mixture to be reduced,
% - Nr, the desired number of components for the reduced mixture (scalar).
% OUTPUTS:
% - gmr, the reduced Gaussian mixture.
% This function implements the algorithm presented in
% Kullback-Leibler Approach to Gaussian Mixture Reduction, A.R. Runnals
assert(~isempty(gmh),'The mixture has to contain at least one element.');

if nargin < 4
    maxiter = 1000;
    tol = 1e-15;
elseif nargin < 5
    tol = 1e-15;
end

gmr = gmh;
Nh = numel(gmh);

pbar = BDBarycenter_mex(gmh,maxiter,tol);
maxCost = CTD(gmh,pbar,'BDij');
alpha = alpha*maxCost;

BMatrix = Inf(Nh,Nh);
pairs = zeros(Nh-1,2);
minCosts = zeros(Nh,1);
normCumCTD = 0;

%We first compute the KLD bounds for every merging action

for i=1:Nh
    for j=1:Nh
        if(i<j)
            BMatrix(i,j) = BDBij(gmr(i),gmr(j),maxiter,tol);
        end
    end
end
for k=2:Nh


    %We then find the action with the lowest KLD bound and we merge the
    %corresponding mixture components
    [i,j] = find(BMatrix == min(BMatrix(BMatrix<Inf)),1);
    %minCosts(k) = minCosts(k-1) + BMatrix(i,j);
    bar = BDBarycenter_mex(gmr([i,j]),maxiter,tol);
    minCosts(k) = BMatrix(i,j);
    
    normCumCTD = normCumCTD + minCosts(k)/maxCost;
    m = (Nh-k+2);
%     alpha*evalBarycenterFun(gmr,pbar,'FKLDij')*2/m
    if minCosts(k) > alpha*evalBarycenterFun(gmr,pbar,'BDij')*2/m + 4*eps || normCumCTD > RTL
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
        newBound = BDBij(bar,gmr(j),maxiter,tol);
        if i<j
            BMatrix(i,j) = newBound;
        else
            BMatrix(j,i) = newBound;
        end
    end

end
    
    
    
end

