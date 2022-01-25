
close all
clear

numPoints = 101;

%rng(1001);

gmh = userDefMixture2;
costMeas = 'sqL2ij';

gmr = FKLDBarycenter(gmh);

%%
%mu = linspace(-4*max(abs([gmh.mu])),4*max(abs([gmh.mu])),numPoints);
mu = linspace(-5,8,numPoints);

sigma = linspace(0.05,8,numPoints);



XBAR = zeros(numPoints);


%Jhh = selfLikeness(gmh);

for i=1:numPoints
    gmr.mu = mu(i);
    for j=1:numPoints
        gmr.Sigma = sigma(j);
        XBAR(i,j) = evalBarycenterFun(gmh,gmr,costMeas);
    end
i
end
%%

figure(4)


[iBAR,jBAR] = find(XBAR==min(min(XBAR)));
gmrBAR = gmr;
gmrBAR.mu = mu(iBAR);
gmrBAR.Sigma = sigma(jBAR);
optBAR = min(min(XBAR));

mesh(mu,sigma,XBAR'); hold on
xlabel('$\mu$','FontSize',34,'Interpreter','latex');
ylabel('$\Sigma$','FontSize',34,'Interpreter','latex');
zlabel('$m_{}(\nu)$','FontSize',34,'Interpreter','latex');
title('$D_{}$-barycenter','FontSize',54,'Interpreter','latex'); hold on
scatter3(gmrBAR.mu,gmrBAR.Sigma,optBAR,100,'r*','LineWidth',12,'SizeData',300); hold on
%plot3([gmrBAR.mu gmrBAR.mu],[gmrBAR.Sigma gmrBAR.Sigma],[min([0;min(min(XBAR))]) optBAR],'k-.','LineWidth',4); hold on
%plot3([min(mu) gmrBAR.mu],[gmrBAR.Sigma gmrBAR.Sigma],[min([0;min(min(XBAR))]) min([0;min(min(XBAR))])],'b-.','LineWidth',4); hold on
%plot3([gmrBAR.mu gmrBAR.mu],[min(sigma) gmrBAR.Sigma],[min([0;min(min(XBAR))]) min([0;min(min(XBAR))])],'g-.','LineWidth',4); hold on
axis([min(mu) max(mu) min(sigma) max(sigma) 0 max(max(XBAR))])
set(gca,'FontSize',34)

