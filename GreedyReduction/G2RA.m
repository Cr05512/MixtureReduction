function gmr = G2RA(gmh, Nr, costMeas)
% gmr = GRA(gmh, Nr):
% INPUTS:
% - gmh, a Gaussian mixture to be reduced,
% - Nr, the desired number of components for the reduced mixture (scalar).
% OUTPUTS:
% - gmr, the reduced Gaussian mixture.
% This function implements the generalized greedy reduction algorithm.
assert(~isempty(gmh),'The mixture has to contain at least one element.');
assert(Nr>0,'The number of reduced components has to be greater than zero.');

if nargin < 3
    costMeas = 'KLDij';
end


if numel(gmh)<Nr
    gmr = gmh;
    return
end
gmr = gmh;
Nh = numel(gmh);
if(Nh==Nr)
    return
elseif(Nr==1)
    gmr = computeBarycenter(gmh,costMeas);
    return
end


fMatrix = Inf(Nh,Nh);

for i=1:Nh
    for j=1:Nh
        if(i<j)
            eta = computeBarycenter(gmr([i;j]),costMeas);
            fMatrix(i,j) = evalBarycenterFun(gmr([i;j]),eta,costMeas);
        end
    end
end

while(numel(gmr)-Nr>0)


    %We then find the action with the lowest KLD bound and we merge the
    %corresponding mixture components
    [i,j] = find(fMatrix == min(fMatrix(fMatrix<Inf)),1);
    bar = computeBarycenter(gmr([i,j]),costMeas);
    gmr(i) = bar;
    gmr(j) = [];
    
    fMatrix(j,:) = [];
    fMatrix(:,j) = [];
    upd_ind = setdiff(1:numel(gmr),i);
    for j=upd_ind
        eta = computeBarycenter(gmr([i;j]),costMeas);
        newCost = evalBarycenterFun(gmr([i;j]),eta,costMeas);
        if i<j
            fMatrix(i,j) = newCost;
        else
            fMatrix(j,i) = newCost;
        end
    end

end
    
    
    
end

