function [gmr,pairs,minCosts,Nr] = adaIalphaJDMRA(gmh, alpha, perc)
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

bar = alphaJDBarycenter(gmh,alpha);
maxCost = evalBarycenterFun(gmh,bar,'alphaJDij',struct('alpha',alpha));

BMatrix = Inf(Nh,Nh);
pairs = zeros(Nh-1,2);
minCosts = zeros(Nh,1);

%We first compute the KLD bounds for every merging action

for i=1:Nh
    for j=1:Nh
        if(i<j)
            BMatrix(i,j) = alphaJDBij(gmr(i),gmr(j),alpha);
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
    bar = alphaJDBarycenter(gmr([i,j]),alpha);
    gmr(i) = bar;
    gmr(j) = [];
    pairs(k,:) = [i,j];
    
    

    BMatrix(j,:) = [];
    BMatrix(:,j) = [];
    upd_ind = setdiff(1:numel(gmr),i);
    for j=upd_ind
        newBound = alphaJDBij(bar,gmr(j),alpha);
        if i<j
            BMatrix(i,j) = newBound;
        else
            BMatrix(j,i) = newBound;
        end
    end

end
    
    
    
end

