clc
clear
close all

global plotTotalGM plotComponents
plotTotalGM = 1;
plotComponents = 0;
getSamples = 1;

%Parameters to play with
Nh = 50;  %Full mixture component number
Nr = 4;   %Reduced mixture component number
n = 1;    %Dimension
nPoints = 300;  %Evaluation points per dimension 
alpha = 2.7;  %Mean spreading factor
beta = 1; %Covariance tuning parameter
nSamples = Nr*n*500;
NKMeansSteps = 10;
sk = 0.001; %Gradient step
NOptSteps = 30; %Gradient iterations
NEMiter = 100;
optWeights = 1; %flag to optimize weights or not


if n==1
    X = linspace(-2*alpha^3, 2*alpha^3,nPoints);
else
    x1 = linspace(-2*alpha^3, 2*alpha^3,nPoints);
    x2 = linspace(-2*alpha^3, 2*alpha^3,nPoints);
    [X1,X2] = meshgrid(x1,x2);
    X = [X1(:) X2(:)];

end

gm = GMGen(Nh,n,alpha,beta);

if getSamples==1
    samples = GMSamples(gm, nSamples);
end

%tic;
%gm_Williams = WilliamsMRA(gm,Nr);
%disp('Williams MRA nISE: ')
%nISE(gm,gm_Williams)
%WilliamsTime = toc;

% tic;
% gm_KI = KIDivergenceMRA(gm,Nr);
% %disp('KI MRA nISE: ')
% %nISE(gm,gm_KI)
% KIDTime = toc;

tic;
[gm_GMRC, nISETrajGMRC] = GMRC(gm,Nr,NKMeansSteps,sk,NOptSteps,optWeights);
disp('GMRC MRA nISE: ')
nISE(gm,gm_GMRC)
GMRCTime = toc;

tic;
gm_Run = RunnalsMRA(gm,Nr);
disp('Runnals MRA nISE: ')
nISE(gm,gm_Run)
RunnalsTime = toc;

% tic
% gm_Refined = newAlgorithm(gm,gm_Run,sk,NOptSteps,optWeights);
% disp('newAlgo MRA nISE: ');
% nISE(gm,gm_Refined)
% newAlgoTime = toc;

% tic
% [gm_Run_Opt, nISETrajRun] = ISEOpt(gm,gm_Run,sk,NOptSteps,optWeights);
% disp('Runnals Optimized MRA nISE: ')
% nISE(gm,gm_Run_Opt)
% Run_OptTime = toc;

% tic;
% gm_Salm = SalmondMRA(gm,Nr);
% %disp('Salmond MRA nISE: ')
% %nISE(gm,gm_Salm)
% SalmondTime = toc;

tic;
gm_GMRCMod = GMRCMod(gm,Nr,NKMeansSteps,sk,NOptSteps,optWeights);
disp('GMRCMod MRA nISE: ');
nISE(gm,gm_GMRCMod)
GMRCModTime = toc;

tic;
gm_EM = EM(gm_Run,samples,NEMiter);
%nISE(gm,gm_EM)
%gm_EM = ISEOpt(gm,gm_EM,sk,NOptSteps,optWeights);
disp('EM MRA nISE: ');
nISE(gm,gm_EM)
EMTime = toc;



%  



 if n==1
      figure(1)
      subplot(2,2,1)
      plotGM1D(gm,X); hold on
      plotGM1D(gm_GMRCMod,X); hold on
      grid minor
      title(strcat('Original vs GMRCMod MRA. nISE: ',num2str(nISE(gm,gm_GMRCMod)),', Time: ',num2str(GMRCModTime),'s'));
      legend('Original Mixture','GMRCMod MRA');
%       subplot(2,2,2)
%       plotGM1D(gm,X); hold on
%       plotGM1D(gm_KI,X); hold on
%       grid minor
%       title(strcat('Original vs KID MRA. nISE: ',num2str(nISE(gm,gm_KI)),', Time: ',num2str(KIDTime),'s'));
%       legend('Original Mixture','KID MRA');
      subplot(2,2,2)
      plotGM1D(gm,X); hold on
      plotGM1D(gm_Run,X); hold on
      grid minor
      title(strcat('Original vs Runnals MRA. nISE: ',num2str(nISE(gm,gm_Run)),', Time: ',num2str(RunnalsTime),'s'));
      legend('Original Mixture','Runnals MRA');
%       subplot(2,2,3)
%       plotGM1D(gm,X); hold on
%       plotGM1D(gm_Salm,X); hold on
%       grid minor
%       title(strcat('Original vs Salmond MRA. nISE: ',num2str(nISE(gm,gm_Salm)),', Time: ',num2str(SalmondTime),'s'));
%       legend('Original Mixture','Salmond MRA');
      subplot(2,2,3)
      plotGM1D(gm,X); hold on
      plotGM1D(gm_GMRC,X); hold on
      grid minor
      title(strcat('Original vs GMRC MRA. nISE: ',num2str(nISE(gm,gm_GMRC)),', Time: ',num2str(GMRCTime),'s'));
      legend('Original Mixture','GMRC MRA');
      
      subplot(2,2,4)
      plotGM1D(gm,X); hold on
      plotGM1D(gm_EM,X); hold on
      grid minor
      title(strcat('Original vs EM MRA. niSE: ', num2str(nISE(gm,gm_EM)),', Time: ', num2str(EMTime + RunnalsTime),'s'));
      legend('Original Mixture', 'EM MRA');
% % %     
% %     legend('Original Mixture','Optimized Runnals','GMRC MRA');
% %     legend('Original Mixture','KI MRA','Runnals MRA','Salmond MRA','Williams MRA','Optimized Runnals');
 elseif n==2
%    
     subplot(2,2,1)
     plotGM2D(gm,x1,x2,X); hold on
     title('Original Mixture')
%     subplot(2,3,2)
%     plotGM2D(gm_KI,x1,x2,X);
%     title('KI MRA')
     subplot(2,2,2)
     plotGM2D(gm_Run,x1,x2,X);
     title('Runnals MRA')
%     subplot(2,3,4)
%     plotGM2D(gm_Salm,x1,x2,X);
%     title('Salmond MRA')
%     subplot(2,3,5)
%     plotGM2D(gm_Williams,x1,x2,X);
%     title('Williams MRA');
    subplot(2,2,3)
    plotGM2D(gm_GMRC,x1,x2,X);
    title('GMRC MRA')
    
    subplot(2,2,4)
    plotGM2D(gm_EM,x1,x2,X);
    title('EM MRA')
    
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


 
  