clc
clear
close all

gmh = userDefMixture2();

numPoints = 71;

gmr = FKLDBarycenter(gmh);

mu = linspace(-3,7,numPoints);

sigma = linspace(0.05,10,numPoints);

 XBAR = zeros(numPoints,numPoints);
 XBSGA = zeros(size(XBAR));

costMeasure = 'H2ij';

for i=1:numPoints
    gmr.mu = mu(i);
    for j=1:numPoints
        gmr.Sigma = sigma(j);
        XBSGA(i,j) = H2123(gmh,gmr,1000);
        XBAR(i,j) = evalBarycenterFun(gmh,gmr,costMeasure);
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
zlabel(strcat('$D_{',costMeasure(1:end-3),'}( \emph{\textbf{w}}^T$\mbox{\boldmath{$\nu$}}','$|| \nu)$'),'FontSize',34,'Interpreter','latex');
title(strcat(['$D_{',costMeasure(1:end-3),'}$-BSGA']),'FontSize',34,'Interpreter','latex');
scatter3(gmrBSGA.mu,gmrBSGA.Sigma,optBSGA,300,'r*','LineWidth',4); hold on
%plot3([gmrBSGA.mu gmrBSGA.mu],[gmrBSGA.Sigma gmrBSGA.Sigma],[min([0;min(min(XBSGA))]) optBSGA],'k-.','LineWidth',4); hold on
%plot3([min(mu) gmrBSGA.mu],[gmrBSGA.Sigma gmrBSGA.Sigma],[min([0;min(min(XBSGA))]) min([0;min(min(XBSGA))])],'b-.','LineWidth',4); hold on
%plot3([gmrBSGA.mu gmrBSGA.mu],[min(sigma) gmrBSGA.Sigma],[min([0;min(min(XBSGA))]) min([0;min(min(XBSGA))])],'g-.','LineWidth',4); hold on
axis([min(mu) max(mu) min(sigma) max(sigma) -0.5 max(max(XBSGA))])
set(gca,'FontSize',34)


[iBAR,jBAR] = find(XBAR==min(min(XBAR)));
gmrBAR = gmr;
gmrBAR.mu = mu(iBAR);
gmrBAR.Sigma = sigma(jBAR);
optBAR = min(min(XBAR));

subplot(1,2,2)
mesh(mu,sigma,XBAR'); hold on
xlabel('\mu','FontSize',34);
ylabel('\Sigma','FontSize',34);
zlabel(strcat('$m_{D_{',costMeasure(1:end-3),'}}(\nu\vert \emph{\textbf{w}},$\mbox{\boldmath{$\nu$}}','$)$'),'FontSize',34,'Interpreter','latex');
title(strcat(['$D_{',costMeasure(1:end-3),'}$-bar']),'FontSize',34,'Interpreter','latex');
scatter3(gmrBAR.mu,gmrBAR.Sigma,optBAR,300,'r*','LineWidth',4); hold on
%plot3([gmrBAR.mu gmrBAR.mu],[gmrBAR.Sigma gmrBAR.Sigma],[min([0;min(min(XBAR))]) optBAR],'k-.','LineWidth',4); hold on
%plot3([min(mu) gmrBAR.mu],[gmrBAR.Sigma gmrBAR.Sigma],[min([0;min(min(XBAR))]) min([0;min(min(XBAR))])],'b-.','LineWidth',4); hold on
%plot3([gmrBAR.mu gmrBAR.mu],[min(sigma) gmrBAR.Sigma],[min([0;min(min(XBAR))]) min([0;min(min(XBAR))])],'g-.','LineWidth',4); hold on
axis([min(mu) max(mu) min(sigma) max(sigma) -0.5 max(max(XBAR))])
set(gca,'FontSize',34)
