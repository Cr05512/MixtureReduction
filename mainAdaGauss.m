clear
close all

seed = randi(1000000); % Nice Seed 703006, Nh = 30, Nr = 5, d = 1, seed 109270
rng(seed);

Nh = 20;
% Nr = 10;
d = 1;
gm = GMGen(Nh,d,1,0.5);
RTL = 0.2;
%%
tic; gmr1 = adaIW2MRA(gm,RTL); toc
     [~,~,minCosts1] = adaIW2MRA(gm,1);
tic; gmr2 = adaIRKLDMRA(gm,RTL); toc
     [~,~,minCosts2] = adaIRKLDMRA(gm,1);
tic; gmr3 = adaIFKLDMRA(gm,RTL); toc
     [~,~,minCosts3] = adaIFKLDMRA(gm,1);

%%
if d==1
    figure(1)
    
    %sgtitle(str);
    hold on
    X = genAxisPoints(gm,1000);
    subplot(2,3,1)
    plotGM1D(gm,X,{'Color','k','LineWidth',4,'LineStyle','-'});
    plotGM1D(gmr1,X,{'Color','r','LineWidth',4,'LineStyle','-.'});
    set(gca,'FontSize',15)
    grid minor
    %axis('square')
    axis([min(X) max(X) 0 max(evalGM(gm,X))*1.4])
    %legend('Original','Reduced');
    legend('Original','$C_{D_{W2}}$-reduced','Interpreter','latex','FontSize',15);
    subplot(2,3,2)
    plotGM1D(gm,X,{'Color','k','LineWidth',4,'LineStyle','-'});
    plotGM1D(gmr2,X,{'Color','g','LineWidth',4,'LineStyle','-.'});
    set(gca,'FontSize',15)
    grid minor
    %axis('square')
    axis([min(X) max(X) 0 max(evalGM(gm,X))*1.4])
    %legend('Original','Reduced');
    legend('Original','$C_{D_{RKL}}$-reduced','Interpreter','latex','FontSize',15);
    subplot(2,3,3)
    plotGM1D(gm,X,{'Color','k','LineWidth',4,'LineStyle','-'});
    plotGM1D(gmr3,X,{'Color','b','LineWidth',4,'LineStyle','-.'});
    set(gca,'FontSize',15)
    grid minor
    %axis('square')
    axis([min(X) max(X) 0 max(evalGM(gm,X))*1.4])
    %legend('Original','Reduced');
    legend('Original','$C_{D_{FKL}}$-reduced','Interpreter','latex','FontSize',15);
    
end

nb1 = numel(gmr1);
nb2 = numel(gmr2);
nb3 = numel(gmr3);
figure(1)
X = Nh:-1:1;
subplot(2,3,[4 5 6])
txt1 = strcat(['$n^b=',num2str(nb1),'$']);
txt2 = strcat(['$n^b=',num2str(nb2),'$']);
txt3 = strcat(['$n^b=',num2str(nb3),'$']);
plot(X,minCosts1,'r','LineWidth',2); hold on
plot(X,minCosts2,'g','LineWidth',2); hold on
plot(X,minCosts3,'b','LineWidth',2); hold on
plot(X,RTL*ones(1,length(X)),'k','LineWidth',2); hold on
text(X(Nh-nb1+1)-0.5,minCosts1(nb1)+0.1,txt1,'Interpreter','latex','FontSize',15,'Color','r');
text(X(Nh-nb2+1),minCosts2(nb2)+0.1,txt2,'Interpreter','latex','FontSize',15,'Color','g');
text(X(Nh-nb3+1),minCosts3(nb3)+0.2,txt3,'Interpreter','latex','FontSize',15,'Color','b');
xlabel('Model order');
axis([1 Nh 0 1])
xticks(flip(X))
grid minor
set(gca,'XDir','reverse')
set(gca,'FontSize',15)
legend('$C_{D_{W2}}$-reduced','$C_{D_{RKL}}$-reduced','$C_{D_{FKL}}$-reduced','Location','northwest','Interpreter','latex','FontSize',15)
title('Comparison of $C_{D,RTL}$ curves for several $D$-measures','Interpreter','latex','FontSize',20)