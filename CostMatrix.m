function C = CostMatrix(gmh,gmr,cost_meas,lambda,I)
% C = CostMatrix(gmh,gmr,cost_meas,lambda,I):
% INPUTS:
% - gmh, gmr, two Gaussian mixtures,
% - cost_meas, desired cost function,
% - lambda, regularization parameter (only needed by the MKLD measure),
% - I, number of virtual samples (only needed by the MKLD measure).
% OUTPUTS:
% C, the cost matrix.
% This function computes the cost matrix based on the following cost
% functions:
% - Kullback-Leibler divergence (KLD),
% - Squared 2-Wasserstein (W2),
% - Generalized Jensen-Shannon divergence (GJSD),
% - Modified KLD (MKLD),
% - L2 distance (L2).

if nargin < 4
    lambda = 0.1;
    I = 10*length(gmh);
elseif nargin < 5
    I = 10*length(gmh);
end

assert(~isempty(gmh) && ~isempty(gmr),'The mixtures have to contain at least one element.');
assert(strcmp(cost_meas,'KLD') || strcmp(cost_meas,'W2') || strcmp(cost_meas,'GJSD') || strcmp(cost_meas,'MKLD') || strcmp(cost_meas,'L2'),...
            'The allowed cost functions are (1) KLD, (2) MKLD, (3) W2, (4) GJSD and (5) L2.');
assert(lambda>=0,'The lambda parameter has to be non-negative.');
assert(I>0,'The number of samples has to be greater than zero.');


Nh = length(gmh);
Nr = length(gmr);

C = zeros(Nh,Nr);


for i=1:length(gmh)
    for j=1:length(gmr)
        if strcmp(cost_meas,'KLD')
            C(i,j) = KLD(gmh(i),gmr(j));
        elseif strcmp(cost_meas,'W2')
            C(i,j) = Wasserstein2Dist(gmh(i),gmr(j));
        elseif strcmp(cost_meas,'GJSD')
            C(i,j) = GJSD(gmh(i),gmr(j));
        elseif strcmp(cost_meas,'MKLD')
            C(i,j) = MKLD(gmh(i),gmr(j),lambda,I);
        elseif strcmp(cost_meas,'L2');
            C(i,j) = L2Gauss(gmh(i),gmr(j));
        end
    end
end

end

