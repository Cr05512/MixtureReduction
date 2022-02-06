function gmr = standardPruning(gmh, gamma)
% gm_pruned = standardPruning(gm, threshold):
% INPUTS:
% - gm, a Gaussian mixture to be pruned,
% - threshold, a threshold over the weights (scalar).
% OUTPUTS:
% - gm_pruned, the resulting mixture.
% This function prunes out all the mixture components whose weights fall
% belowe a given threshold.

if nargin < 2
    gamma = 0.05;
end
assert(~isempty(gmh),'The mixture has to contain at least one element.');
assert(gamma>0 && gamma<1,'The threshold is bounded between 0 and 1.');

w = [gmh.w]';


indexes = find(w>=gamma);
gmr = gmh(indexes);
w_pruned = w(indexes);
w_pruned = num2cell(w_pruned./sum(w_pruned));
[gmr.w] = w_pruned{:};



end

