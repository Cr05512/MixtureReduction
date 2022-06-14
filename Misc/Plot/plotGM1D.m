function [h,X] = plotGM1D(gm,X,lineProps)
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
    lineProps = {'LineWidth',2,'LineStyle','-','Color','k'};
elseif nargin < 3
    lineProps = {'LineWidth',2,'LineStyle','-','Color','g','LineStyle','-.'};
end

assert(~isempty(gm),'The mixture has to contain at least one element.');
assert(~isempty(X),'The evaluation points have to be at least one.');


h = plot(X,evalGM(gm,X),lineProps{:}); hold on
xlabel('$x$','Interpreter','latex','FontSize',30);
ylabel('$p(x)$','Interpreter','latex','FontSize',30);

end