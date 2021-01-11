function gm_pruned = standardPruning(gm, threshold)
% gm_pruned = standardPruning(gm, threshold):
% INPUTS:
% - gm, a Gaussian mixture to be pruned,
% - threshold, a threshold over the weights (scalar).
% OUTPUTS:
% - gm_pruned, the resulting mixture.
% This function prunes out all the mixture components whose weights fall
% belowe a given threshold.

if nargin < 2
    threshold = 0.05;
end
assert(~isempty(gm),'The mixture has to contain at least one element.');
assert(threshold>0 && threshold<1,'The threshold is bounded between 0 and 1.');

w = [gm.w]';


indexes = find(w>=threshold);
gm_pruned = gm(indexes);
w_pruned = w(indexes);
w_pruned = num2cell(w_pruned./sum(w_pruned));
[gm_pruned.w] = w_pruned{:};



end

