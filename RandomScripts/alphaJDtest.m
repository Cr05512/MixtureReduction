clc
close all
clear

gm = GMGen(10,1);


idxs = randperm(10,2);

step = 0.0001;

alpha = 0:step:1;

g1 = gm(idxs(1));
g2 = gm(idxs(2));

DaVal = zeros(1,length(alpha));

%%

for i=1:length(alpha)
    DaVal(i) = alphaJDij(g1,g2,alpha(i));
end

%%
figure(2)
plot(alpha,DaVal,'LineWidth',3); hold on
grid minor
xlabel('\alpha','FontSize',30);
ylabel('$D_{\alpha}(\nu_1||\nu_2)$','FontSize',30,'Interpreter','latex');
title('\alpha-divergence value between two gaussians as function of \alpha','FontSize',30)
txt1 = '\leftarrow D_{FKL}';
txt2 = '\leftarrow D_{RKL}';
text(0,DaVal(1),txt1,'FontSize',24); hold on
text(1,DaVal(end),txt2,'FontSize',24); hold on
scatter(1,RKLDij(g1,g2),100,'m*','LineWidth',4);
scatter(0,FKLDij(g1,g2),100,'r*','LineWidth',4);
[minVal,minIdx] = min(DaVal);
% txtmin = horzcat('$\leftarrow \alpha^*=$',num2str(alpha(minIdx)),', $D_{\alpha}^*=$',num2str(minVal));
% text(alpha(minIdx),minVal,txtmin,'FontSize',24,'Interpreter','latex');
% scatter(alpha(minIdx),minVal,100,'k*','LineWidth',4);
