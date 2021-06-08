clc
clear
close all

gm = GMGen(10,2);

[X,x1,x2] =   genAxisPoints(gm,500);
gm1 = ISEBarycenter(gm);
gm2 = NISEBSGA(gm);
gm3 = TSLBSGA(gm);
gm4 = CSDBSGA(gm);
gm5 = KLDBarycenter(gm);

%%
subplot = @(m,n,p) subtightplot (m, n, p, [0.06 0.005], [0.1 0.1], [0.1 0.1]);

subplot(2,3,1)
plotGM2D(gm,X,x1,x2);  hold on
for k=1:numel(gm)
    errEllVals = errorEllipses(gm(k).mu,gm(k).Sigma,0.95);
    plot(gm(k).mu(1),gm(k).mu(2),'rx','LineWidth',2); hold on
    plot(errEllVals(1,:),errEllVals(2,:),'LineWidth',2); hold on
end
axis([-15 15 -20 20])
set(gca,'XTick',[])
set(gca,'YTick',[])
title('Original Mixture')
subplot(2,3,2)
plotGM2D(gm1,X,x1,x2); hold on
errEllVals = errorEllipses(gm1.mu,gm1.Sigma,0.95);
plot(gm1.mu(1),gm1.mu(2),'rx','LineWidth',2); hold on
plot(errEllVals(1,:),errEllVals(2,:),'LineWidth',2); hold on
axis([-15 15 -20 20])
set(gca,'XTick',[])
set(gca,'YTick',[])
title('ISE BSGA')
subplot(2,3,3)
plotGM2D(gm2,X,x1,x2); hold on
errEllVals = errorEllipses(gm2.mu,gm2.Sigma,0.95);
plot(gm2.mu(1),gm2.mu(2),'rx','LineWidth',2); hold on
plot(errEllVals(1,:),errEllVals(2,:),'LineWidth',2); hold on
axis([-15 15 -20 20])
set(gca,'XTick',[])
set(gca,'YTick',[])
title('NISE BSGA')
subplot(2,3,4)
plotGM2D(gm3,X,x1,x2); hold on
errEllVals = errorEllipses(gm3.mu,gm3.Sigma,0.95);
plot(gm3.mu(1),gm3.mu(2),'rx','LineWidth',2); hold on
plot(errEllVals(1,:),errEllVals(2,:),'LineWidth',2); hold on
axis([-15 15 -20 20])
set(gca,'XTick',[])
set(gca,'YTick',[])
title('TSL BSGA')
subplot(2,3,5)
plotGM2D(gm4,X,x1,x2); hold on
errEllVals = errorEllipses(gm4.mu,gm4.Sigma,0.95);
plot(gm4.mu(1),gm4.mu(2),'rx','LineWidth',2); hold on
plot(errEllVals(1,:),errEllVals(2,:),'LineWidth',2); hold on
axis([-15 15 -20 20])
set(gca,'XTick',[])
set(gca,'YTick',[])
title('CSD BSGA')
subplot(2,3,6)
plotGM2D(gm5,X,x1,x2); hold on
errEllVals = errorEllipses(gm5.mu,gm5.Sigma,0.95);
plot(gm5.mu(1),gm5.mu(2),'rx','LineWidth',2); hold on
plot(errEllVals(1,:),errEllVals(2,:),'LineWidth',2); hold on
axis([-15 15 -20 20])
set(gca,'XTick',[])
set(gca,'YTick',[])
title('KLD BSGA')
