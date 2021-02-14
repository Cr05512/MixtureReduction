function [] = plotGM1D(gm,X)
% [] = plotGM1D(gm,X):
% INPUTS:
% - gm, a Gaussian mixture,
% - X, a linspace of points where to evaluate the support (1 x nPoints vector).
% This function plots the support of an univariate Gaussian mixture provided a
% linspace of points.
assert(~isempty(gm),'The mixture has to contain at least one element.');
assert(~isempty(X),'The evaluation points have to be at least one.');


plot(X,evalGM(gm,X),'LineWidth',1.5); hold on


end