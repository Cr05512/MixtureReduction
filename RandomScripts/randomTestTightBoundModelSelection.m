clc
clear
close all

Nh = 14;
d = 5;
gmh = GMGen(Nh,d,Nh*d,d);

costs = zeros(1,Nh-1);
for i=1:Nh-1
    gmrSoft = IFKLDMRA(gmh,Nh-i);
    K = length(gmrSoft);
    costs(i) = -2*tCrossEntropyUB(gmh,gmrSoft)/Nh;
end

[~,maxIdx] = max(costs);
gmrSoft = IFKLDMRA(gmh,Nh-maxIdx+1);
gmrHard = ada3IFKLDMRA(gmh,Nh,0.2);
gmrSoftRef = tightFKLDBRef(gmrSoft,gmh,2*d,100,1e-12);
gmrHardRef = tightFKLDBRef(gmrHard,gmh,2*d,100,1e-12);
[~,~,minCosts] = adaIFKLDMRA(gmh,1);

figure(1)
subplot(2,2,1)
if d==1
X = genAxisPoints(gmh,1000);
plotGM1D(gmh,X,{'LineWidth',4}); hold on
grid minor
plotGM1D(gmrSoft,X,{'Color','r','LineStyle','-.','LineWidth',4});
plotGM1D(gmrHard,X,{'Color','g','LineStyle','--','LineWidth',4});
legend('Original','SoftReduced','HardReduced')
end
subplot(2,2,2)
if d==1
X = genAxisPoints(gmh,1000);
plotGM1D(gmh,X,{'LineWidth',4}); hold on
grid minor
plotGM1D(gmrSoftRef,X,{'Color','r','LineStyle','-.','LineWidth',4});
plotGM1D(gmrHardRef,X,{'Color','g','LineStyle','--','LineWidth',4});
legend('Original','SoftReduced','HardReduced')
end
subplot(2,2,3)
plot(1:Nh,minCosts); hold on
grid minor
subplot(2,2,4)
plot(1:Nh-1,costs); hold on
grid minor