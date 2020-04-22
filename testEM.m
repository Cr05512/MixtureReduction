clc
clear
close all

%Parameters to play with
N = 10; %Mixture components
n = 1;    %Dimension
nSamples = n*N*2000;
nPoints = 300;  %Evaluation points per dimension 
alpha = 2.5;  %Mean spreading factor
beta = 1; %Covariance tuning parameter
numIter = 300;

gm = GMGen(N,n,alpha,beta);

if n==1
    X = linspace(-2*alpha^3, 2*alpha^3,nPoints);
else
    x1 = linspace(-2*alpha^3, 2*alpha^3,nPoints);
    x2 = linspace(-2*alpha^3, 2*alpha^3,nPoints);
    [X1,X2] = meshgrid(x1,x2);
    X = [X1(:) X2(:)];

end

samples = GMSamples(gm, nSamples);

gm_Init = GMGen(N,n,alpha,beta);

%%

gm_EM = EM(gm_Init, samples, numIter);


if n==1
    figure(1)
    scatter(samples,zeros(size(samples))); hold on
    plotGM1D(gm,X); hold on
    plotGM1D(gm_Init,X); hold on
    plotGM1D(gm_EM,X); hold on
    grid minor
    legend('Samples','Target','Init','Estimated')
elseif n==2
    figure(1)
    subplot(2,2,1)
    plotGM2D(gm,x1,x2,X); hold on
    title('Target');
    subplot(2,2,2)
    plotGM2D(gm_Init,x1,x2,X); hold on
    title(strcat('Init. nISE: ',num2str(nISE(gm,gm_Init))));
    subplot(2,2,3)
    plotGM2D(gm_EM,x1,x2,X); hold on
    title(strcat('Estimated. nISE: ',num2str(nISE(gm,gm_EM))));
end
    
%%
