function gmr = clusteringUTKLDord(gmr,gmh,NSteps,numRings,order)
% gmr = clusterinUTKLD(gmr,gmh,NSteps,coeffs):
% INPUTS:
% - gmr, gmh, two Gaussian mixture densities,
% - NSteps, number of iterations for the clustering loop (scalar),
% - numRings, number of sigma-point rings.
% OUTPUTS:
% - gmr, the refined Gaussian mixture.
% This function implements the clustering loop as shown in:
% Gaussian Mixture Reduction via Clustering, D. Schieferdecker, M.F. Huber
% by using the UTKLD as global measure.
d = size(gmh(1).mu,1);
if nargin < 3
    NSteps = 1;
    numRings =  1;
    order = 'ascend';
elseif nargin < 4
    numRings =  1;
    order = 'ascend';
elseif nargin < 5
    order = 'ascend';
end

assert(~isempty(gmh) && ~isempty(gmr),'The mixtures have to contain at least one element.');
assert(any(strcmpi(order,{'descend','ascend'})),'The order can be either ascend or descend.');

Nh = numel(gmh);
Nr = numel(gmr);
cost_vector = Inf(1,Nr);


[~,perm] = sort([gmh.w],order);
gmh_temp = gmh(perm);
Rnk = computeAssignMatrix(gmh_temp,gmr,'KLD');

SPs = kRingUT(gmh,numRings);
sphVals = evalGM(gmh_temp,SPs);
for k=1:NSteps

    for i=1:Nh
        for j=1:Nr
            %1. reassociate site n_i to cluster C_j
            Rnk(i,:) = zeros(1,Nr);
            Rnk(i,j) = 1;
            
            %2. recompute temporary centroids with such association matrix
            gmr = computeClusterCentersGM(gmh_temp,Rnk,'KLD');
            
            
            
            logVals = log(sphVals./evalGM(gmr,SPs));
            val = 0;
            for m=1:Nh
                val = val + gmh(m).w*sum(logVals(((m-1)*(2*numRings*d+1)+1):m*(2*numRings*d+1)));
            end
           
            cost_vector(j) = val/(2*numRings*d+1);
        end
        
        %3. Associate site n_i to C_j for which cost_vector(j) is minimal
        [~,ind] = min(cost_vector);
        Rnk(i,:) = zeros(1,Nr);
        Rnk(i,ind) = 1;
        %4. Recompute the centers
        gmr = computeClusterCentersGM(gmh_temp,Rnk,'KLD');
    end  

end


end