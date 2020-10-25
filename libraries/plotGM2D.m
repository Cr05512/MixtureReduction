function [] = plotGM2D(gm,x1,x2,X)
% [] = plotGM2D(gm,X):
% INPUTS:
% - gm, a Gaussian mixture,
% - x1, x2, X, vectors and grid of points where to evaluate the support.
% This function plots the support of a bivariate Gaussian mixture provided a
% mesh of points.
assert(~isempty(gm),'The mixture has to contain at least one element.');
assert(~isempty(X),'The evaluation points have to be at least one.');


gmTot = zeros(length(x1)*length(x2),1);
for i=1:length(gm)
    gmTot = gmTot + gm(i).w*mvnpdf(X,gm(i).mu',gm(i).Sigma);
end
gmTot = reshape(gmTot,length(x1),length(x2));
%mesh(x1,x2,gmTot,'LineWidth',1.5);
imagesc(x1,x2,gmTot);
cb = colorbar();
cb.Ruler.Exponent = 0;
axis([min(x1) max(x1) min(x2) max(x2)]);


end

