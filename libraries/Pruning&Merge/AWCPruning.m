function gmr = AWCPruning(gm,rho)
% gmr = AWCPruning(gm, rho):
% INPUTS:
% - gm, a Gaussian Mixture,
% - rho, percentile threshold.
% OUTPUTS:
% - gmr, the pruned mixture.
% This function performs an Adaptive Weight-Censoring Pruning. It basically
% prunes all the components which are not "enough informative". Rho is a
% threshold usually set to 1,2 or 3 sigmas.
if nargin < 2
    rho = 0.9544;
end
assert(length(gm)>=1,'The mixture has to contain at least one element.');
assert(rho>0 && rho<=1,'The threshold has to be between 0 and 1.');

%Adaptive weight-censored pruning
N = length(gm);
[w_sort,perm] = sort([gm.w]);
gamma = zeros(N,1);

for i=1:N
    gamma(i) = sum(w_sort(i:end))/sum(w_sort);
end

nmax = max(find(gamma>=rho));
w_bar = w_sort(nmax+1:end);
w_bar = w_bar./sum(w_bar);
perm = perm(nmax+1:end);
gmr = gm(perm);

%disp(strcat(num2str(length(gm)-length(gmr)),' components have been pruned.'));
w = num2cell(w_bar);
[gmr.w] = w{:};


%disp(horzcat('Pruned : ',num2str(nmax),' components.'));

end

