function [gmr,Rnk] = GMKMeans(gmr,gmh,costMeas,NKMeansSteps)
% [gmr,Rnk] = GMKMeans(gmr,gmh,costMeas,NKMeansSteps):
% INPUTS:
% - gmr, gmh, respectively the reduced and original mixtures,
% - costMeas, the cost functio used to compute the distance between components (char array),
% - NKMeansSteps, maximum number of allowed iterations for the KMeans algorithm (scalar).
% OUTPUTS:
% - gmr, the refined mixture.
% - Rnk, final cluster association matrix (Nh x Nr matrix).
% This function operates a K-Means refinement over the reduced mixture in
% order to improve the corresponding parameters.
if nargin < 3
    costMeas = 'KLD';
    NKMeansSteps = 100;
elseif nargin < 4
    NKMeansSteps = 100;
end
assert(~isempty(gmh) && ~isempty(gmr),'The mixtures have to contain at least one element.');
assert(NKMeansSteps>0,'The number of kmeans iterations has to be greater than zero.');

J = Inf;
JPrev = J;
for k=1:NKMeansSteps
   
    [Rnk, C] = computeAssignMatrix(gmh,gmr,costMeas);
    
    J = trace(Rnk'*C);
    
    if abs(J-JPrev)<1e-12
        break;
    end
    JPrev = J;

    gmr = computeClusterCentersGM(gmh,Rnk,costMeas);

end


end
