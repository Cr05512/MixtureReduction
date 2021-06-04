clc
clear 
close all

gm = testWilliams();
gmrKLD = reduce('Runnalls',gm,2);
gmrISE = reduce('Williams',gm,2);

X = -50:0.000001:50;
sOrig = evalGM(gm,X);
sRun = evalGM(gmrKLD,X);
sWil = evalGM(gmrISE,X);

fRun = sOrig.*log(sOrig./sRun);
fWil = sOrig.*log(sOrig./sWil);

KLDRun = trapz(X,fRun);
KLDWil = trapz(X,fWil);
%%

X = genAxisPoints(gm,500);
hh = plotGM1D(gm,X,'k'); hold on
hKLD = plotGM1D(gmrKLD,X,'r'); hold on
hISE = plotGM1D(gmrISE,X,'g'); hold on
grid minor; hold on
set(gca,'FontSize',34)
set(hh,'LineWidth',4);
set(hKLD,'LineWidth',4);
set(hISE,'LineWidth',4);
legend('Original Mixture','Runnalls Reduction','Williams Reduction','FontSize',34,'Position',[0.650694450715346,0.685046303566811,0.254687493201345,0.183315033119675]);



title({strcat(['Williams, ISE:',' ',num2str(ISE(gm,gmrISE),'%1.7f'),', KLD:',' ',num2str(KLDWil,'%1.7f')]),...
       strcat(['Runnalls, ISE:',' ',num2str(ISE(gm,gmrKLD),'%1.7f'),', KLD:',' ',num2str(KLDRun,'%1.7f')])},...
               'FontSize',34,'HorizontalAlignment','right');