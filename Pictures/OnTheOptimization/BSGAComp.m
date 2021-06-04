clc
clear
close all

gm = testWilliams;

X =   genAxisPoints(gm,1000);
gm1 = ISEBarycenter(gm);
gm2 = NISEBSGA(gm);
gm3 = TSLBSGA(gm);
gm4 = CSDBSGA(gm);
gm5 = KLDBarycenter(gm);

plotGM1D(gm,X,'k');  hold on
plotGM1D(gm1,X,'r'); hold on
plotGM1D(gm2,X,'g'); hold on
plotGM1D(gm3,X,'b'); hold on
plotGM1D(gm4,X,'m'); hold on
plotGM1D(gm5,X,'c'); hold on
grid minor
title('BSGA Comparison')
%axis([-2 5 0 1.2])
legend('Original Mixture','ISE BSGA','NISE BSGA','TSL BSGA','CSD BSGA','KLD BSGA','FontSize',34)

res1 = strcat('\mu_{ISE}:',' ',num2str(gm1.mu,'%1.4f'),', \Sigma_{ISE}:',' ',num2str(gm1.Sigma,'%1.4f'));
res2 = strcat('\mu_{NISE}:',' ',num2str(gm2.mu,'%1.4f'),', \Sigma_{NISE}:',' ',num2str(gm2.Sigma,'%1.4f'));
res3 = strcat('\mu_{TSL}:',' ',num2str(gm3.mu,'%1.4f'),', \Sigma_{TSL}:',' ',num2str(gm3.Sigma,'%1.4f'));
res4 = strcat('\mu_{CSD}:',' ',num2str(gm4.mu,'%1.4f'),', \Sigma_{CSD}:',' ',num2str(gm4.Sigma,'%2.4f'));
res5 = strcat('\mu_{KLD}:',' ',num2str(gm5.mu,'%1.4f'),', \Sigma_{KLD}:',' ',num2str(gm5.Sigma,'%2.4f'));

str = {res1,res2,res3,res4,res5};

t = annotation('textbox');
t.BackgroundColor = 'w';
t.FontSize = 30;
t.String = str;