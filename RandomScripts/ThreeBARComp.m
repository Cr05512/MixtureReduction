
close all
clear

numPoints = 101;

%rng(1001);

gmh = GMGen(2,1,5,0.09);

gmr = KLDBarycenter(gmh);
gmrKLD = gmr;

%%
%mu = linspace(-4*max(abs([gmh.mu])),4*max(abs([gmh.mu])),numPoints);
mu = linspace(-5,5,numPoints);

sigma = linspace(0.01,5,numPoints);


XBAR1 = zeros(numPoints,numPoints);
XBAR2 = zeros(size(XBAR1));
XBAR3 = zeros(size(XBAR1));
% XCSD = zeros(size(XTSL));
% XCSD = zeros(size(XNISE));

%Jhh = selfLikeness(gmh);

for i=1:numPoints
    gmr.mu = mu(i);
    for j=1:numPoints
        gmr.Sigma = sigma(j);
%         Jhr = crossLikeness(gmh,gmr);
%         Jrr = selfLikeness(gmr);
        XBAR1(i,j) = ISE(gmh,gmr);
        XBAR2(i,j) = NISE(gmh,gmr);
        XBAR3(i,j) = TSL(gmh,gmr);
%        XTSL(i,j,k) = XISE(i,j)/(Jhh + Jrr);
%         XCSD(i,j) = -log(Jhr) + 0.5*(log(Jhh*Jrr));
%         XJR2D(i,j) = JR2D(gmh,gmr);
    end
i
end
%%

figure(4)

[iBAR1,jBAR1] = find(XBAR1==min(min(XBAR1)));

gmrBAR1 = gmr;
gmrBAR1.mu = mu(iBAR1);
gmrBAR1.Sigma = sigma(jBAR1);
optBAR1 = min(min(XBAR1));

subplot(1,3,1)
mesh(mu,sigma,XBAR1'); hold on
xlabel('\mu','FontSize',24);
ylabel('\Sigma','FontSize',24);
zlabel('BAR1Val','FontSize',24);
title(strcat(['BAR1: \mu=',num2str(gmrBAR1.mu),', ','\Sigma=',num2str(gmrBAR1.Sigma)]),'FontSize',24);
scatter3(gmrBAR1.mu,gmrBAR1.Sigma,optBAR1,100,'r*','LineWidth',4); hold on
%plot3([gmrBAR1.mu gmrBAR1.mu],[gmrBAR1.Sigma gmrBAR1.Sigma],[min([0;min(min(XBSGA))]) optBSGA],'k-.','LineWidth',4); hold on
%plot3([min(mu) gmrBAR1.mu],[gmrBAR1.Sigma gmrBAR1.Sigma],[min([0;min(min(XBSGA))]) min([0;min(min(XBSGA))])],'b-.','LineWidth',4); hold on
%plot3([gmrBAR1.mu gmrBAR1.mu],[min(sigma) gmrBAR1.Sigma],[min([0;min(min(XBSGA))]) min([0;min(min(XBSGA))])],'g-.','LineWidth',4); hold on
axis([min(mu) max(mu) min(sigma) max(sigma) 0 max(max(XBAR1))])
set(gca,'FontSize',24)


[iBAR2,jBAR2] = find(XBAR2==min(min(XBAR2)));
gmrBAR2 = gmr;
gmrBAR2.mu = mu(iBAR2(1));
gmrBAR2.Sigma = sigma(jBAR2(1));
optBAR2 = min(min(XBAR2));

subplot(1,3,2)
mesh(mu,sigma,XBAR2'); hold on
xlabel('\mu','FontSize',24);
ylabel('\Sigma','FontSize',24);
zlabel('BAR2Val','FontSize',24);
title(strcat(['BAR2: \mu=',num2str(gmrBAR2.mu),', ','\Sigma=',num2str(gmrBAR2.Sigma)]),'FontSize',24); hold on
scatter3(gmrBAR2.mu,gmrBAR2.Sigma,optBAR2,100,'r*','LineWidth',4); hold on
%plot3([gmrBAR2.mu gmrBAR2.mu],[gmrBAR2.Sigma gmrBAR2.Sigma],[min([0;min(min(XBAR2))]) optBAR2],'k-.','LineWidth',4); hold on
%plot3([min(mu) gmrBAR2.mu],[gmrBAR2.Sigma gmrBAR2.Sigma],[min([0;min(min(XBAR2))]) min([0;min(min(XBAR2))])],'b-.','LineWidth',4); hold on
%plot3([gmrBAR2.mu gmrBAR2.mu],[min(sigma) gmrBAR2.Sigma],[min([0;min(min(XBAR2))]) min([0;min(min(XBAR2))])],'g-.','LineWidth',4); hold on
axis([min(mu) max(mu) min(sigma) max(sigma) 0 max(max(XBAR2))])
set(gca,'FontSize',24)


[iBAR3,jBAR3] = find(XBAR3==min(min(XBAR3)));
gmrBAR3 = gmr;
gmrBAR3.mu = mu(iBAR3(1));
gmrBAR3.Sigma = sigma(jBAR3(1));
optBAR3 = min(min(XBAR3));

subplot(1,3,3)
mesh(mu,sigma,XBAR3'); hold on
xlabel('\mu','FontSize',24);
ylabel('\Sigma','FontSize',24);
zlabel('BAR3Val','FontSize',24);
title(strcat(['BAR3: \mu=',num2str(gmrBAR3.mu),', ','\Sigma=',num2str(gmrBAR3.Sigma)]),'FontSize',24); hold on
scatter3(gmrBAR3.mu,gmrBAR3.Sigma,optBAR3,100,'r*','LineWidth',4); hold on
%plot3([gmrBAR3.mu gmrBAR3.mu],[gmrBAR3.Sigma gmrBAR3.Sigma],[min([0;min(min(XBAR3))]) optBAR3],'k-.','LineWidth',4); hold on
%plot3([min(mu) gmrBAR3.mu],[gmrBAR3.Sigma gmrBAR3.Sigma],[min([0;min(min(XBAR3))]) min([0;min(min(XBAR3))])],'b-.','LineWidth',4); hold on
%plot3([gmrBAR3.mu gmrBAR3.mu],[min(sigma) gmrBAR3.Sigma],[min([0;min(min(XBAR3))]) min([0;min(min(XBAR3))])],'g-.','LineWidth',4); hold on
axis([min(mu) max(mu) min(sigma) max(sigma) 0 max(max(XBAR3))])
set(gca,'FontSize',24)


