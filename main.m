clc
clear
close all

global plotTotalGM plotComponents
plotTotalGM = 1;
plotComponents = 0;


Nh = 20;
Nr = 5;
nPoints = 2000;
alpha = 4;
beta = 3;

mu = -alpha^2 + 2*alpha^2*rand(Nh,1)';
Sigma = ones(Nh,1) + beta*rand(Nh,1);
w = rand(Nh,1);
w_bar = w./sum(w);

gm = GMGen1D(w_bar,mu,Sigma);

x = linspace(-2*alpha^2, 2*alpha^2,nPoints);

figure(1)
plotGM(gm,x); hold on
%merged = mpMerge(gm(1),gm(2));
%plot(x,merged.getPDF(x),'k');
tic
gm_r = RunnalsMRA(gm,Nr);
toc
plotGM(gm_r,x); hold on
grid minor
legend('Original Mixture','Reduced Mixture')

