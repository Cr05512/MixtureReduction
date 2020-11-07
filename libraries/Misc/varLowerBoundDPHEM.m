function L = varLowerBoundDPHEM(gmh,gmr,E,Z,I)
% L = varLowerBoundDPHEM(gmh,gmr,E,Z,I):
% INPUTS:
% - gmh, gmr, two Gaussian mixtures,
% - E, expected log-Gaussian matrix
% - Z, responsibilities,
% - I, number of virtual samples.
% OUTPUTS:
% - L, variational lower bound for the expected log-likelihood.
% This function computes the variational lower bound for the expected
% log-likelihood as seen in the DPHEM algorithm.
if nargin < 4
    I = length(gmh);
end
assert(~isempty(gmh) && ~isempty(gmr),'The mixtures have to contain at least one element.');
assert(~isempty(E) && ~isempty(Z),'The E and Z matrices must be non-empty.');
assert(I>0,'The number of virtual samples has to be greater than zero.');

L = 0;
for i=1:length(gmh)
    for j=1:length(gmr)
        if Z(i,j)>0
            L = L + gmh(i).w*Z(i,j)*(log(gmr(j).w/Z(i,j)) + E(i,j));
        end
    end
end
L = I*L;

end

