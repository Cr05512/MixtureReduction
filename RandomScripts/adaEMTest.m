clc
clear
close all

%data = load("testData.mat").data;
%data = load("beansData.mat").beansData([randperm(16,2)],:);
%data = load("wineData.mat").wineData([1,2],:);
data = load("penDigitsData.mat").penDigitsData(randperm(16,6),:);
%%
Nh = 6;
RTL = 0.25;
gm = EM(data,Nh);
gmr = ada3IFKLDMRA(gm,2*Nh,RTL);
gmr = EM(data,numel(gmr),1000,gmr);


figure(1)
if size(data,1)==2
subplot(2,2,1)
scatter(data(1,:),data(2,:)); hold on
for k=1:numel(gm)
    errEllVals = errorEllipses(gm(k).mu,gm(k).Sigma,0.95);
    plot(errEllVals(1,:),errEllVals(2,:)); hold on
end
BIC(gm,data)

subplot(2,2,2)
scatter(data(1,:),data(2,:)); hold on
for k=1:numel(gmr)
    errEllVals = errorEllipses(gmr(k).mu,gmr(k).Sigma,0.95);
    plot(errEllVals(1,:),errEllVals(2,:),'r'); hold on
end


end
subplot(2,2,[3 4])
nb = numel(gmr);
[~,~,minCosts] = adaIFKLDMRA(gm,1);
%minCosts = diff(minCosts);
txt = strcat(['$n^b=',num2str(nb),'$']);
X = Nh:-1:1;
xlabel('$n^b$','Interpreter','latex'); hold on
axis([1 Nh 0 1])
xticks(flip(X))
grid minor
set(gca,'XDir','reverse')
set(gca,'FontSize',20)
title('(b)','Interpreter','latex','FontSize',25)
KLDVec = zeros(Nh,1);
BICVec = KLDVec;
BICVec(1) = BIC(gm,data);
% tKLDVec = KLDVec;
CTDVec1 = KLDVec;
CTDVec2 = KLDVec;
for i=2:Nh
    red = IFKLDMRA(gm,Nh-i+1);
%    KLDVec(i) = FKLD123(gm,red,500);
    BICVec(i) = BIC(red,data);
% % 
% %     %CTDVec1(i) = CTDVec1(i-1) + CTD(IFKLDMRA(gm,Nh-i+2),red,'FKLDij');
%      CTDVec2(i) = CTD(gm,red,'FKLDij');
end
barCost = CTD(gm,FKLDBarycenter(gm),'FKLDij');
%KLDVec = KLDVec./barCost;
CTDVec2 = CTDVec2./barCost;
CTDVec1 = CTDVec1./barCost;
%BICVec = BICVec./barCost;

h1 = plot(X,CTDVec2,'m','LineWidth',4); hold on
h2 = plot(X,minCosts,'g','LineWidth',4); hold on
plot(X,KLDVec,'r','LineWidth',4); hold on
h3=plot(X,RTL*ones(1,length(X)),'k','LineWidth',4); hold on
text(X(2),0.25,'$\gamma_{R\!T\!L}$','Interpreter','latex','FontSize',25,'Color','k'); hold on
text(X(Nh-nb+1),minCosts(nb)+0.2,txt,'Interpreter','latex','FontSize',25,'Color',[0.00,0.45,0.74]); hold on
legend('$R_{D_{F\!K\!L}}$','$\widetilde{R}_{D_{F\!K\!L}}$','$\bar{D}_{F\!K\!L}$','Location','northwest','Interpreter','latex','FontSize',30)
uistack(h2,'top');
uistack(h3,'bottom')
BIC(gmr,data)
%%
figure(2)
plot(X,BICVec,'LineWidth',3); hold on
xticks(flip(X))
set(gca,'XDir','reverse')
[~,minIdx] = min(flip(BICVec));
scatter(minIdx,BICVec(Nh-minIdx+1),200,'ro'); hold on
grid minor

