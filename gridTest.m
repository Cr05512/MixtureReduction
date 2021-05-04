
close all
clear

numPoints = 101;

%rng(1001);

gmh = GMGen(6,1);

gmr = KLDBarycenter(gmh);
gmrKLD = gmr;

%%
%mu = linspace(-4*max(abs([gmh.mu])),4*max(abs([gmh.mu])),numPoints);
mu = linspace(-2,4,numPoints);

sigma = linspace(0.001,15,numPoints);


XNISE = zeros(numPoints,numPoints);
XBAR = zeros(size(XNISE));
% XCSD = zeros(size(XNISE));
% XCSD = zeros(size(XNISE));

%Jhh = selfLikeness(gmh);

for i=1:numPoints
    gmr.mu = mu(i);
    for j=1:numPoints
        gmr.Sigma = sigma(j);
%         Jhr = crossLikeness(gmh,gmr);
%         Jrr = selfLikeness(gmr);
        XNISE(i,j) = NISE(gmh,gmr);
        XBAR(i,j) = evalBarycenterFun(gmh,gmr,'NL2ij');
%        XNISE(i,j,k) = XISE(i,j)/(Jhh + Jrr);
%         XCSD(i,j) = -log(Jhr) + 0.5*(log(Jhh*Jrr));
%         XJR2D(i,j) = JR2D(gmh,gmr);
    end
i
end
%%

figure(4)

[iNISE,jNISE] = find(XNISE==min(min(XNISE)));

gmrNISE = gmr;
gmrNISE.mu = mu(iNISE);
gmrNISE.Sigma = sigma(jNISE);
optNISE = min(min(XNISE));

subplot(1,2,1)
mesh(mu,sigma,XNISE'); hold on
xlabel('\mu');
ylabel('\Sigma');
zlabel('NISE');
title(strcat(['NISE BSGA: \mu=',num2str(gmrNISE.mu),', ','\Sigma=',num2str(gmrNISE.Sigma)]));
scatter3(gmrNISE.mu,gmrNISE.Sigma,optNISE,100,'r*','LineWidth',4); hold on
plot3([gmrNISE.mu gmrNISE.mu],[gmrNISE.Sigma gmrNISE.Sigma],[0 optNISE],'k-.','LineWidth',4); hold on
plot3([min(mu) gmrNISE.mu],[gmrNISE.Sigma gmrNISE.Sigma],[0 0],'b-.','LineWidth',4); hold on
plot3([gmrNISE.mu gmrNISE.mu],[min(sigma) gmrNISE.Sigma],[0 0],'g-.','LineWidth',4); hold on
axis([min(mu) max(mu) min(sigma) max(sigma) 0 max(max(XNISE))])
set(gca,'FontSize',34)


[iBAR,jBAR] = find(XBAR==min(min(XBAR)));
gmrBAR = gmr;
gmrBAR.mu = mu(iBAR(1));
gmrBAR.Sigma = sigma(jBAR(1));
optBAR = min(min(XBAR));

subplot(1,2,2)
mesh(mu,sigma,XBAR'); hold on
xlabel('\mu');
ylabel('\Sigma');
zlabel('BARVal');
title(strcat(['NISE Bar: \mu=',num2str(gmrBAR.mu),', ','\Sigma=',num2str(gmrBAR.Sigma)])); hold on
scatter3(gmrBAR.mu,gmrBAR.Sigma,optBAR,100,'r*','LineWidth',4); hold on
plot3([gmrBAR.mu gmrBAR.mu],[gmrBAR.Sigma gmrBAR.Sigma],[0 optBAR],'k-.','LineWidth',4); hold on
plot3([min(mu) gmrBAR.mu],[gmrBAR.Sigma gmrBAR.Sigma],[0 0],'b-.','LineWidth',4); hold on
plot3([gmrBAR.mu gmrBAR.mu],[min(sigma) gmrBAR.Sigma],[0 0],'g-.','LineWidth',4); hold on
axis([min(mu) max(mu) min(sigma) max(sigma)])
set(gca,'FontSize',34)

% subplot(2,2,4)
% plotGM1D(gmh,points); hold on
% plotGM1D(gmrNISE,points); hold on
% plotGM1D(gmrKLD,points); hold on
% grid minor
% legend('Original','NISEBarycenter','KLDBarycenter');
% 
% [iCSD,jCSD] = find(XCSD==min(min(XCSD)));
% gmrCSD = gmr;
% gmrCSD.mu = mu(iCSD);
% gmrCSD.Sigma = sigma(jCSD);
% optCSD = CSD(gmh,gmrCSD);
% 
% subplot(2,2,3)
% mesh(mu,sigma,XCSD'); hold on
% xlabel('\mu');
% ylabel('\Sigma');
% zlabel('CSDVal');
% title(strcat(['CSD Bar: \mu=',num2str(gmrCSD.mu),', ','\Sigma=',num2str(gmrCSD.Sigma)])); hold on
% scatter3(gmrCSD.mu,gmrCSD.Sigma,optCSD,100,'r*','LineWidth',4); hold on
% plot3([gmrCSD.mu gmrCSD.mu],[gmrCSD.Sigma gmrCSD.Sigma],[0 optCSD],'k-.','LineWidth',4); hold on
% plot3([min(mu) gmrCSD.mu],[gmrCSD.Sigma gmrCSD.Sigma],[0 0],'b-.','LineWidth',4); hold on
% plot3([gmrCSD.mu gmrCSD.mu],[min(sigma) gmrCSD.Sigma],[0 0],'g-.','LineWidth',4); hold on
% axis([min(mu) max(mu) 0 max(sigma)])
% set(gca,'FontSize',34)
% 
% 
% [iJR2D,jJR2D] = find(-XJR2D==min(min(-XJR2D)));
% gmrJR2D = gmr;
% gmrJR2D.mu = mu(iJR2D);
% gmrJR2D.Sigma = sigma(jJR2D);
% optJR2D = JR2D(gmh,gmrJR2D);
% subplot(2,2,4)
% mesh(mu,sigma,-XJR2D'); hold on
% xlabel('\mu');
% ylabel('\Sigma');
% zlabel('JR2DVal');
% title(strcat(['JR2D Bar: \mu=',num2str(gmrJR2D.mu),', ','\Sigma=',num2str(gmrJR2D.Sigma)])); hold on
% scatter3(gmrJR2D.mu,gmrJR2D.Sigma,optJR2D,100,'r*','LineWidth',4); hold on
% plot3([gmrJR2D.mu gmrJR2D.mu],[gmrJR2D.Sigma gmrJR2D.Sigma],[0 optJR2D],'k-.','LineWidth',4); hold on
% plot3([min(mu) gmrJR2D.mu],[gmrJR2D.Sigma gmrJR2D.Sigma],[0 0],'b-.','LineWidth',4); hold on
% plot3([gmrJR2D.mu gmrJR2D.mu],[min(sigma) gmrJR2D.Sigma],[0 0],'g-.','LineWidth',4); hold on
% axis([min(mu) max(mu) 0 max(sigma)])
% set(gca,'FontSize',34)
% 
% 
% 
% 
% 
% 
% 
% 
% 
