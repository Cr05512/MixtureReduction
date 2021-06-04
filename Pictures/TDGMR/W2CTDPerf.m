clc
clear
close all

data = [0.3850 3.2976 14.9441 29.8003 45.3921 59.9964;...
        0.3559 2.9384 12.2286 22.8439 34.2316 45.7351];
    
figure(1)

X = [1 2 4 6 8 10];

plot(X,data(1,:),'r','LineWidth',6); hold on;
plot(X,data(2,:),'g','LineWidth',6); hold on;
scatter(X,data(1,:),600,'r','d','filled'); hold on
scatter(X,data(2,:),600,'g','o','filled'); hold on;
grid minor

axis([1 10 0 60])

legend('W2DGR','W2CTDGR','FontSize',34,'Location','NorthWest');
xlabel('$d$','FontSize',42,'Interpreter','latex');
ylabel('$C_{W2}(f^a||g^b)$','FontSize',42,'Interpreter','latex');
title('W2DGR vs W2CTDGR','FontSize',34);