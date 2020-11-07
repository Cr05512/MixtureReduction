function [gmr,Rnk] = GMKMeans(gmh,gmr,cost_meas,NKMeansSteps)
% gmr = GMKMeans(gmh,gmr,cost_meas,NKMeansSteps):
% INPUTS:
% - gmh, gmr, two Gaussian mixtures,
% - cost_meas, the cost functio used to compute the distance between components,
% - NKMeansSteps, maximum number of allowed iterations for the KMeans algorithm.
% OUTPUTS:
% - gmr, the refined mixture.
% - Rnk, final cluster association matrix.
% This function operates a K-Means refinement over the reduced mixture in
% order to improve the corresponding parameters.
if nargin < 3
    cost_meas = 'KLD';
    NKMeansSteps = 100;
elseif nargin < 4
    NKMeansSteps = 100;
end
assert(~isempty(gmh) && ~isempty(gmr),'The mixtures have to contain at least one element.');
assert(NKMeansSteps>0,'The number of kmeans iterations has to be greater than zero.');


C = Inf(length(gmh),length(gmr));
Rnk = zeros(size(C));
J = Inf;
JPrev = J;
for k=1:NKMeansSteps
   
    C = CostMatrix(gmh,gmr,cost_meas);

    [~,assignVector] = min(C,[],2);
    
    for i=1:length(gmh)
        Rnk(i,assignVector(i)) = 1;
    end
    
    J = trace(Rnk'*C);
    
    if abs(J-JPrev)<1e-12
        break;
    end

    gmr = computeClusterCentersGM(gmh,Rnk,cost_meas);

    JPrev = J;
    if k<NKMeansSteps
        Rnk = zeros(size(C)); %Reset of the associations
    end
end
% if k<NKMeansSteps
%     disp(horzcat('KMeans converged after ',num2str(k),' steps'));
% end

end
