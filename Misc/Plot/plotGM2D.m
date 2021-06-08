function [] = plotGM2D(gm,X,x1,x2)
% [] = plotGM2D(gm,X):
% INPUTS:
% - gm, a Gaussian mixture,
% - x1, x2, X, vectors and grid of points where to evaluate the support.
% This function plots the support of a bivariate Gaussian mixture provided a
% mesh of points.
assert(~isempty(gm),'The mixture has to contain at least one element.');
assert(~isempty(X),'The evaluation points have to be at least one.');

gmTot = reshape(evalGM(gm,X'),length(x1),length(x2));


h = imagesc(x1,x2,gmTot);
% cb = colorbar();
% cb.Ruler.Exponent = 1;
axis([min(x1) max(x1) min(x2) max(x2)]);


end
