clear
close all

seed = randi(1000000); % Nice Seed 703006, Nh = 30, Nr = 5, d = 1, seed 109270
rng(seed);

Nh = 20;
% Nr = 10;
d = 1;
gm =  testCrouse();GMGen(Nh,d,Nh/d,d);
Nh = numel(gm);
RTL = 1;


%%
I = 0.3;
tic; gmr = ada3IFKLDMRA(gm,I,RTL); toc
%tic; gmr = adaIFKLDMRA(gm,RTL); toc
[~,~,minCosts] = adaIFKLDMRA(gm,1);
%%
if d==1
    figure(1)
    
    %sgtitle(str);
    hold on
    X = genAxisPoints(gm,5000);
%     plotGM1D(gm,X,{'Color','k','LineWidth',4,'LineStyle','-'});
    subplot(2,3,[1 2 3])
    plotGM1D(gm,X,{'Color','k','LineWidth',4,'LineStyle','-'});
    plotGM1D(gmr,X,{'Color',[0.07,0.62,1.00],'LineWidth',4,'LineStyle','-.'});
    set(gca,'FontSize',20)
    grid minor
    %axis('square')
    axis([min(X) max(X) 0 max(evalGM(gm,X))*1.4])
    %legend('Original','Reduced');
    title('(a)','Interpreter','latex','FontSize',25)
    legend('Original','ada-$C_{D_{FKL}}$','Interpreter','latex','FontSize',30);
    set(gca,'FontSize',20)
end

% if d==2
%     figure(1)
% 
%     hold on
%     [X,x1,x2] = genAxisPoints(gm,500);
% end

nb = numel(gmr);
figure(1)
X = Nh:-1:1;
subplot(2,3,[4 5 6])
txt = strcat(['$n^b=',num2str(nb),'$']);

xlabel('$n^b$','Interpreter','latex'); hold on
axis([1 Nh 0 1])
xticks(flip(X))
grid minor
set(gca,'XDir','reverse')
set(gca,'FontSize',20)
title('(b)','Interpreter','latex','FontSize',25)

KLDVec = zeros(Nh,1);
% tKLDVec = KLDVec;
CTDVec1 = KLDVec;
CTDVec2 = KLDVec;
 for i=2:Nh
     red = IFKLDMRA(gm,Nh-i+1);
     KLDVec(i) = FKLD123(gm,red,1000/(d^2));
% 
%     %CTDVec1(i) = CTDVec1(i-1) + CTD(IFKLDMRA(gm,Nh-i+2),red,'FKLDij');
     CTDVec2(i) = CTD(gm,red,'FKLDij');
 end
barCost = CTD(gm,FKLDBarycenter(gm),'FKLDij');
KLDVec = KLDVec./barCost;
CTDVec2 = CTDVec2./barCost;
CTDVec1 = CTDVec1./barCost;
% 
% a = minCosts(2:end)-minCosts(1:end-1);
% a = a(2:end) - a(1:end-1);
% if any(a<0)
%     disp('AAAAAAAAAAAAAAA');
% end

%norm(CTDVec1-minCosts)

h1 = plot(X,CTDVec2,'m','LineWidth',4); hold on
h2 = plot(X,minCosts,'g--','LineWidth',4); hold on
plot(X,KLDVec,'r','LineWidth',4); hold on
h3=plot(X,RTL*ones(1,length(X)),'k','LineWidth',4); hold on
text(X(2),0.25,'$\gamma=20\%$','Interpreter','latex','FontSize',25,'Color','k'); hold on
text(X(Nh-nb+1),minCosts(nb)+0.2,txt,'Interpreter','latex','FontSize',25,'Color',[0.00,0.45,0.74]); hold on

% 
% plot(X,CTDVec1,'m-.','LineWidth',2); hold on
a = abs(CTDVec2-minCosts);
if any(a>1e-9)
    disp('AAAAA');
end
legend('$R_{D_{F\!K\!L}}$','$\widetilde{R}_{D_{F\!K\!L}}$','$\bar{D}_{F\!K\!L}$','Location','northwest','Interpreter','latex','FontSize',30)
uistack(h2,'top');
uistack(h3,'bottom')