clc
clear
close all

global plotTotalGM plotComponents
plotTotalGM = 1;
plotComponents = 0;
getSamples = 0;

%Parameters to play with
Nh = 20;  %Full mixture component number
Nr = 4 ;   %Reduced mixture component number
n = 1;    %Dimension
nPoints = 300;  %Evaluation points per dimension 
alpha = 2.8;  %Mean spreading factor
beta = 1; %Covariance tuning parameter
nSamples = 1000;
NKMeansSteps = 10;
sk = 0.001; %Gradient step
NOptSteps = 20; %Gradient iterations
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
    X = linspace(-4*alpha^3, 4*alpha^3,nPoints);
else
    x1 = linspace(-2*alpha^3, 2*alpha^3,nPoints);
    x2 = linspace(-2*alpha^3, 2*alpha^3,nPoints);
    [X1,X2] = meshgrid(x1,x2);
    X = [X1(:) X2(:)];

end

gm = GMGen(w_bar,mu,Sigma);

tic;
gm_Williams = WilliamsMRA(gm,Nr);
%disp('Williams MRA nISE: ')
%nISE(gm,gm_Williams)
WilliamsTime = toc;

tic;
gm_KI = KIDivergenceMRA(gm,Nr);
%disp('KI MRA nISE: ')
%nISE(gm,gm_KI)
KIDTime = toc;

tic;
gm_Run = RunnalsMRA(gm,Nr);
%disp('Runnals MRA nISE: ')
%nISE(gm,gm_Run)
RunnalsTime = toc;

%[gm_Run_Opt, nISETrajRun] = ISEOpt(gm,gm_Run,sk,NOptSteps,optWeights);
%disp('Runnals Optimized MRA nISE: ')
%nISE(gm,gm_Run_Opt)

tic;
gm_Salm = SalmondMRA(gm,Nr);
%disp('Salmond MRA nISE: ')
%nISE(gm,gm_Salm)
SalmondTime = toc;

tic;
[gm_GMRC, nISETrajGMRC] = GMRC(gm,Nr,NKMeansSteps,sk,NOptSteps,optWeights);
%disp('GMRC MRA nISE: ')
%nISE(gm,gm_GMRC)
GMRCTime = toc;
 
if getSamples==1
    samples = GMSamples(gm, nSamples);
end


 if n==1
      figure(1)
      subplot(2,3,1)
      plotGM1D(gm,X); hold on
      plotGM1D(gm_Williams,X); hold on
      grid minor
      title(strcat('Original vs Williams MRA. nISE: ',num2str(nISE(gm,gm_Williams)),', Time: ',num2str(WilliamsTime)));
      legend('Original Mixture','Williams MRA');
      subplot(2,3,2)
      plotGM1D(gm,X); hold on
      plotGM1D(gm_KI,X); hold on
      grid minor
      title(strcat('Original vs KID MRA. nISE: ',num2str(nISE(gm,gm_KI)),', Time: ',num2str(KIDTime)));
      legend('Original Mixture','KID MRA');
      subplot(2,3,3)
      plotGM1D(gm,X); hold on
      plotGM1D(gm_Run,X); hold on
      grid minor
      title(strcat('Original vs Runnals MRA. nISE: ',num2str(nISE(gm,gm_Run)),', Time: ',num2str(RunnalsTime)));
      legend('Original Mixture','Runnals MRA');
      subplot(2,3,4)
      plotGM1D(gm,X); hold on
      plotGM1D(gm_Salm,X); hold on
      grid minor
      title(strcat('Original vs Salmond MRA. nISE: ',num2str(nISE(gm,gm_Salm)),', Time: ',num2str(SalmondTime)));
      legend('Original Mixture','Salmond MRA');
      subplot(2,3,5)
      plotGM1D(gm,X); hold on
      plotGM1D(gm_GMRC,X); hold on
      grid minor
      title(strcat('Original vs GMRC MRA. nISE: ',num2str(nISE(gm,gm_GMRC)),', Time: ',num2str(GMRCTime)));
      legend('Original Mixture','GMRC MRA');
% %     
%     legend('Original Mixture','Optimized Runnals','GMRC MRA');
%     legend('Original Mixture','KI MRA','Runnals MRA','Salmond MRA','Williams MRA','Optimized Runnals');
 elseif n==2
%    
     subplot(2,2,1)
     plotGM2D(gm,x1,x2,X); hold on
     title('Original Mixture')
%     subplot(2,3,2)
%     plotGM2D(gm_KI,x1,x2,X);
%     title('KI MRA')
%     subplot(2,2,2)
%     plotGM2D(gm_Run_Opt,x1,x2,X);
%     title('Optimized Runnals MRA')
%     subplot(2,3,4)
%     plotGM2D(gm_Salm,x1,x2,X);
%     title('Salmond MRA')
%     subplot(2,3,5)
%     plotGM2D(gm_Williams,x1,x2,X);
%     title('Williams MRA');
    subplot(2,2,3)
    plotGM2D(gm_GMRC,x1,x2,X);
    title('GMRC MRA')
%     
 end
%  figure(2)
%  subplot(2,1,1)
%  plot(0:NOptSteps-1, nISETrajRun); hold on
%  title('nISE Optimization for Runnals MRA')
%  grid minor
%  subplot(2,1,2)
%  plot(0:NOptSteps-1, nISETrajGMRC); hold on
%  title('nISE Optimization for GMRC MRA')
%  grid minor


 
  