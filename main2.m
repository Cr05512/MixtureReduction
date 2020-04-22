clc
clear
close all

global plotTotalGM plotComponents
plotTotalGM = 1;
plotComponents = 0;
getSamples = 0;

%Parameters to play with
Nh = 20;  %Full mixture component number
Nr = 5;   %Reduced mixture component number
n = 2;    %Dimension
nPoints = 300;  %Evaluation points per dimension 
alpha = 2.5;  %Mean spreading factor
beta = 1; %Covariance tuning parameter
nSamples = 1000;
NKMeansSteps = 10;
sk = 0.01; %Gradient step
NOptSteps = 10; %Gradient iterations
optWeights = 1; %flag to optimize weights or not

%Generate weights
w = rand(Nh,1);
w_bar = w./sum(w);

%Generate means
mu = -alpha^3*ones(n,Nh) + alpha^3*2*rand(n,Nh);

%Generate Symmetric Positive Definite Covariance matrices
Sigma = zeros(n,n,Nh);
for i=1:Nh
    sigma = rand(n,n); % generate a random nxn matrix
    % construct a symmetric matrix using either
    %sigma = 0.5*(sigma+sigma');
    sigma = sigma*sigma';
    sigma = sigma + beta*n*eye(n);
    Sigma(:,:,i) = sigma;
end


if n==1
    X = linspace(-2*alpha^3, 2*alpha^3,nPoints);
else
    x1 = linspace(-2*alpha^3, 2*alpha^3,nPoints);
    x2 = linspace(-2*alpha^3, 2*alpha^3,nPoints);
    [X1,X2] = meshgrid(x1,x2);
    X = [X1(:) X2(:)];

end

gm = GMGen(w_bar,mu,Sigma);

tic;
gm_Run = RunnalsMRA(gm,Nr);
%disp('Runnals MRA nISE: ')
nISE(gm,gm_Run)
RunnalsTime = toc;

tic;
[gm_GMRC, nISETrajGMRC] = GMRC(gm,Nr,NKMeansSteps,sk,NOptSteps,optWeights);
%disp('GMRC MRA nISE: ')
nISE(gm,gm_GMRC)
GMRCTime = toc;

tic
gm_GMRCMod = GMRCMod(gm,Nr,NKMeansSteps,sk,NOptSteps,optWeights);
%disp('newAlgo MRA nISE: ');
nISE(gm,gm_GMRCMod)
GMRCModTime = toc;

tic
gm_Refined = newAlgorithm(gm,gm_Run,sk,NOptSteps,optWeights);
nISE(gm,gm_Refined)
gm_RefinedTime = toc;

if n==1
      figure(1)
      subplot(2,2,1)
      plotGM1D(gm,X); hold on
      plotGM1D(gm_Run,X); hold on
      grid minor
      title(strcat('Original vs Runnals MRA. nISE: ',num2str(nISE(gm,gm_Run)),', Time: ',num2str(RunnalsTime),'s'));
      legend('Original Mixture','Runnals MRA');
      subplot(2,2,2)
      plotGM1D(gm,X); hold on
      plotGM1D(gm_GMRC,X); hold on
      grid minor
      title(strcat('Original vs GMRC MRA. nISE: ',num2str(nISE(gm,gm_GMRC)),', Time: ',num2str(GMRCTime),'s'));
      legend('Original Mixture','GMRC MRA');
      subplot(2,2,3)
      plotGM1D(gm,X); hold on
      plotGM1D(gm_GMRCMod,X); hold on
      grid minor
      title(strcat('Original vs GMRCMod MRA. nISE: ',num2str(nISE(gm,gm_GMRCMod)),', Time: ',num2str(GMRCModTime),'s'));
      legend('Original Mixture','newAlgo MRA');
      subplot(2,2,4)
      plotGM1D(gm,X); hold on
      plotGM1D(gm_Refined,X); hold on
      grid minor
      title(strcat('Original vs newAlgo MRA. nISE: ',num2str(nISE(gm,gm_Refined)),', Time: ',num2str(gm_RefinedTime),'s'));
elseif n==2
%    
     subplot(2,2,1)
     plotGM2D(gm,x1,x2,X); hold on
     title('Original Mixture')
     subplot(2,2,2)
     plotGM2D(gm_Run,x1,x2,X);
     title(strcat('Runnals MRA. nISE: ',num2str(nISE(gm,gm_Run)),', Time: ',num2str(RunnalsTime),'s'));
     subplot(2,2,3)
     plotGM2D(gm_GMRC,x1,x2,X);
     title(strcat('GMRC MRA. nISE: ',num2str(nISE(gm,gm_GMRC)),', Time: ',num2str(GMRCTime),'s'));
%     subplot(2,3,4)
%     plotGM2D(gm_Salm,x1,x2,X);
%     title('Salmond MRA')
%     subplot(2,3,5)
%     plotGM2D(gm_Williams,x1,x2,X);
%     title('Williams MRA');
    subplot(2,2,4)
    plotGM2D(gm_GMRCMod,x1,x2,X);
    title(strcat('GMRCMod MRA. nISE: ',num2str(nISE(gm,gm_GMRCMod)),', Time: ',num2str(GMRCModTime),'s'));
 end