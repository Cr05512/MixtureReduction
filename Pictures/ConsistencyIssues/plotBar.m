function [] = plotBar(gmh,gmr_vector)
% gmr_vector{2}.mu = 1;
% gmr_vector{2}.Sigma = 0.44;
% gmr_vector{3}.mu = 2;
% gmr_vector{3}.Sigma = 0.2;
% gmr_vector{2} = refine('ISEOptCon',gmr_vector{2},gmh);
% gmr_vector{3} = refine('NISEOptCon',gmr_vector{3},gmh);
X = genAxisPoints(gmh,1000);
h1 = plotGM1D(gmh,X); hold on
h2 = plotGM1D(gmr_vector{1},X); hold on
h3 = plotGM1D(gmr_vector{2},X); hold on
h4 = plotGM1D(gmr_vector{3},X); hold on
res1 = strcat('\mu:',' ',num2str(gmr_vector{1}.mu,'%2.4f'),', \Sigma:',' ',num2str(gmr_vector{1}.Sigma,'%2.4f'));
res2 = strcat('\mu:',' ',num2str(gmr_vector{2}.mu,'%2.4f'),', \Sigma:',' ',num2str(gmr_vector{2}.Sigma,'%2.4f'));
res3 = strcat('\mu:',' ',num2str(gmr_vector{3}.mu,'%2.4f'),', \Sigma:',' ',num2str(gmr_vector{3}.Sigma,'%2.4f'));

str1 = strcat(['KLD',' ',res1]);
str2 = strcat(['ISE',' ',res2]);
str3 = strcat(['NISE',' ',res3]);
set(h1,'LineWidth',4);
set(h2,'LineWidth',4);
set(h3,'LineWidth',4);
set(h4,'LineWidth',4);

grid minor
set(gca,'FontSize',34);
tPos = [0.710000637705608,1.01377633711507,0];
title({str1,str2,str3},'FontSize',34,'HorizontalAlignment','right','Units','normalized','Position',tPos);
set(gca,'OuterPosition',[0,0.000230515916575,1,0.875762628866544]);
set(gca,'InnerPosition',[0.13,0.133092026878959,0.775,0.677218920739169]);
set(gca,'Position',[0.13,0.133092026878959,0.775,0.677218920739169]);
set(gca,'PlotBoxAspectRatio',[1,0.416666666666667,0.416666666666667]);

%legend('Original Mixture','ISE Barycenter','NISE Barycenter','FontSize',34)
legend('Original Mixture','KLD Barycenter','ISE Barycenter','NISE Barycenter','FontSize',34)
xlabel('x','FontSize',34)
ylabel('p(x)','FontSize',34)
end

