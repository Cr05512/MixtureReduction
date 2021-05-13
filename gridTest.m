
close all
clear

numPoints = 101;

%rng(1001);

gmh = userDefMixture2;

gmr = KLDBarycenter(gmh);
gmrKLD = gmr;

%%
%mu = linspace(-4*max(abs([gmh.mu])),4*max(abs([gmh.mu])),numPoints);
mu = linspace(-2,4,numPoints);

sigma = linspace(0.1,6,numPoints);


XBSGA = zeros(numPoints,numPoints);
XBAR = zeros(size(XBSGA));
% XCSD = zeros(size(XTSL));
% XCSD = zeros(size(XNISE));

%Jhh = selfLikeness(gmh);

for i=1:numPoints
    gmr.mu = mu(i);
    for j=1:numPoints
        gmr.Sigma = sigma(j);
%         Jhr = crossLikeness(gmh,gmr);
%         Jrr = selfLikeness(gmr);
        XBSGA(i,j) = JR2D(gmh,gmr);
        XBAR(i,j) = evalBarycenterFun(gmh,gmr,'JR2Dij');
%        XTSL(i,j,k) = XISE(i,j)/(Jhh + Jrr);
%         XCSD(i,j) = -log(Jhr) + 0.5*(log(Jhh*Jrr));
%         XJR2D(i,j) = JR2D(gmh,gmr);
    end
i
end
%%

figure(4)

[iBSGA,jBSGA] = find(XBSGA==min(min(XBSGA)));

gmrBSGA = gmr;
gmrBSGA.mu = mu(iBSGA);
gmrBSGA.Sigma = sigma(jBSGA);
optBSGA = min(min(XBSGA));

subplot(1,2,1)
mesh(mu,sigma,XBSGA'); hold on
xlabel('\mu','FontSize',34);
ylabel('\Sigma','FontSize',34);
zlabel('BSGAVal','FontSize',34);
title(strcat(['BSGA: \mu=',num2str(gmrBSGA.mu),', ','\Sigma=',num2str(gmrBSGA.Sigma)]),'FontSize',34);
scatter3(gmrBSGA.mu,gmrBSGA.Sigma,optBSGA,100,'r*','LineWidth',4); hold on
plot3([gmrBSGA.mu gmrBSGA.mu],[gmrBSGA.Sigma gmrBSGA.Sigma],[0 optBSGA],'k-.','LineWidth',4); hold on
plot3([min(mu) gmrBSGA.mu],[gmrBSGA.Sigma gmrBSGA.Sigma],[0 0],'b-.','LineWidth',4); hold on
plot3([gmrBSGA.mu gmrBSGA.mu],[min(sigma) gmrBSGA.Sigma],[0 0],'g-.','LineWidth',4); hold on
axis([min(mu) max(mu) min(sigma) max(sigma) min([0;min(min(XBSGA))]) max(max(XBSGA))])
set(gca,'FontSize',34)


[iBAR,jBAR] = find(XBAR==min(min(XBAR)));
gmrBAR = gmr;
gmrBAR.mu = mu(iBAR(1));
gmrBAR.Sigma = sigma(jBAR(1));
optBAR = min(min(XBAR));

subplot(1,2,2)
mesh(mu,sigma,XBAR'); hold on
xlabel('\mu','FontSize',34);
ylabel('\Sigma','FontSize',34);
zlabel('BARVal','FontSize',34);
title(strcat(['Bar: \mu=',num2str(gmrBAR.mu),', ','\Sigma=',num2str(gmrBAR.Sigma)]),'FontSize',34); hold on
scatter3(gmrBAR.mu,gmrBAR.Sigma,optBAR,100,'r*','LineWidth',4); hold on
plot3([gmrBAR.mu gmrBAR.mu],[gmrBAR.Sigma gmrBAR.Sigma],[0 optBAR],'k-.','LineWidth',4); hold on
plot3([min(mu) gmrBAR.mu],[gmrBAR.Sigma gmrBAR.Sigma],[0 0],'b-.','LineWidth',4); hold on
plot3([gmrBAR.mu gmrBAR.mu],[min(sigma) gmrBAR.Sigma],[0 0],'g-.','LineWidth',4); hold on
axis([min(mu) max(mu) min(sigma) max(sigma)])
set(gca,'FontSize',34)

