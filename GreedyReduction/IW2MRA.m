function [gmr,pairs,minCosts] = IW2MRA(gmh, Nr)
% gmr = IW2MRA(gmh, Nr):
% INPUTS:
% - gmh, a Gaussian mixture to be reduced,
% - Nr, the desired number of components for the reduced mixture (scalar).
% OUTPUTS:
% - gmr, the reduced Gaussian mixture.
% This function computes the reduced mixture according to the Improved W2
% Mixture reduction algorithm.
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
    gmr = W2Barycenter(gmh);
    return
end


WMatrix = Inf(Nh,Nh);
pairs = zeros(Nh-Nr,2);
minCosts = zeros(Nh-Nr,1);
%We first compute the KLD bounds for every merging action

for i=1:Nh
    for j=1:Nh
        if(i<j)
            WMatrix(i,j) = W2Bij(gmr(i),gmr(j));
        end
    end
end

for k=1:Nh-Nr


    %We then find the action with the lowest KLD bound and we merge the
    %corresponding mixture components
    [i,j] = find(WMatrix == min(WMatrix(WMatrix<Inf)),1);
    bar = W2Barycenter(gmr([i,j]));
    gmr(i) = bar;
    gmr(j) = [];
    pairs(k,:) = [i,j];
    minCosts(k) = WMatrix(i,j);
    WMatrix(j,:) = [];
    WMatrix(:,j) = [];
    upd_ind = setdiff(1:numel(gmr),i);
    for j=upd_ind
        newBound = W2Bij(bar,gmr(j));
        if i<j
            WMatrix(i,j) = newBound;
        else
            WMatrix(j,i) = newBound;
        end
    end

end
    
    
    
end

