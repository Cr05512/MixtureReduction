function [Rnk,C] = computeAssignMatrix(gmh,gmr,costMeas)
% Rnk = computeAssignMatrix(gmh,gmr,costMeas):
% INPUT:
% - gmh, gmr, two Gaussian Mixtures,
% - costMeas, cost measure (char array).
% OUTPUT:
% - Rnk, assignment matrix (Nh x Nr binary matrix).

C = CostMatrix(gmh,gmr,costMeas);

Rnk = zeros(size(C));

[~,assignVector] = min(C,[],2);

for i=1:numel(gmh)
    Rnk(i,assignVector(i)) = 1;
end

end

