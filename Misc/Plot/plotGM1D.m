function [h,X] = plotGM1D(gm,X,color,linestyle)
% [] = plotGM1D(gm,X):
% INPUTS:
% - gm, a Gaussian mixture,
% - X, a linspace of points where to evaluate the support (1 x nPoints vector).
% This function plots the support of an univariate Gaussian mixture provided a
% linspace of points.
d = size(gm(1).mu,1);
assert(d==1,'The dimension has to be one.');

if nargin < 2
    X = genAxisPoints(gm,1000);
    color = rand(1,3);
    linestyle = '-';
elseif nargin < 3
    color = rand(1,3);
    linestyle = '-';
elseif nargin < 4
    linestyle = '-';
end

assert(~isempty(gm),'The mixture has to contain at least one element.');
assert(~isempty(X),'The evaluation points have to be at least one.');


h = plot(X,evalGM(gm,X),'LineWidth',1.5,'Color',color,'LineStyle',linestyle); hold on
xlabel('x');
ylabel('p(x)');


end