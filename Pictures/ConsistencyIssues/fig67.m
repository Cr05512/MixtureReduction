close all
clear


gm = testWilliams();

gmr = reduce('Williams',gm,2);

X = genAxisPoints(gm,500);
hh = plotGM1D(gm,X,'k'); hold on
hr = plotGM1D(gmr,X,'g'); hold on
grid minor; hold on
set(gca,'FontSize',34)
set(hh,'LineWidth',4);
set(hr,'LineWidth',4);
legend('Original Mixture','Reduced Mixture','FontSize',34,'Position',[0.678038200304014,0.801676379522173,0.227083327357346,0.123490666060757]);
titlePos = [4.327982497471634,0.202092053189437,0];
title('Williams reduction algorithm, ISE barycenters (BSGAs).','FontSize',34,'Position',titlePos)
dim = [0.2 0.5 0.3 0.3];
textPos = [0.130629166666667,0.854884743808264,0.208854160597548,0.069992468046844];
annotation('textbox',dim,'String',strcat(['ISE:',' ',num2str(ISE(gm,gmr))]),'FitBoxToText','on',...
           'FontSize',34,'Position',textPos,'HorizontalAlignment','left',...
           'LineWidth',0.001,'BackgroundColor','w');