function [] = plotGM1D(gm,X)
% [] = plotGM1D(gm,X):
% INPUTS:
% - gm, a Gaussian mixture,
% - X, a linspace of points where to evaluate the support.
% This function plots the support of an univariate Gaussian mixture provided a
% linspace of points.
assert(~isempty(gm),'The mixture has to contain at least one element.');
assert(~isempty(X),'The evaluation points have to be at least one.');


gmTot = zeros(1,length(X));


for i=1:length(gm)
    gmTot = gmTot + gm(i).w*normpdf(X,gm(i).mu,sqrt(gm(i).Sigma));
end
plot(X,gmTot,'LineWidth',1.5); hold on


end

