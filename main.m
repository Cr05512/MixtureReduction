clc
clear
close all


%Parameters to play with
global Nh Nr n
Nh = 2;  %Full mixture component number
Nr = 1;   %Reduced mixture component number
r = 8;
n = 1;    %Dimension
nPoints = 300;  %Evaluation points per dimension 
alpha = 2.6;  %Mean spreading factor
beta = 4; %Covariance tuning parameter
nSamples = Nr*1500;
NKMeansSteps = 20;
sk = 0.005; %Gradient step
NOptSteps = 10; %Gradient iterations
NEMiter = 10;
optWeights = 1; %flag to optimize weights or not


%gm = GMGen(Nh,n,alpha,beta);
%gm = test4CompGen(Nh,r);
gm = testWilliamsCompGen();
%%

if n==1
    X = linspace(-alpha^3, alpha^3,nPoints);
elseif n==2
    x1 = linspace(-2*alpha^3, 2*alpha^3,nPoints);
    x2 = linspace(-2*alpha^3, 2*alpha^3,nPoints);
    [X1,X2] = meshgrid(x1,x2);
    X = [X1(:) X2(:)];

end



tic;
gm_Williams = WilliamsMRA(gm,Nr);
gm_Williams = ISEOpt(gm,gm_Williams,sk,NOptSteps,optWeights);
WilliamsTime = toc;
disp('Williams MRA nISE: ')
nISE(gm,gm_Williams)

% tic;
% gm_KI = KIDivergenceMRA(gm,Nr);
% %disp('KI MRA nISE: ')
% %nISE(gm,gm_KI)
% KIDTime = toc;
%%
tic;
[gm_GMRC,nISETraj] = GMRC(gm,Nr,NKMeansSteps,sk,NOptSteps,optWeights);
GMRCTime = toc;
disp('GMRC MRA nISE: ')
nISE(gm,gm_GMRC)
%%
tic;
gm_Run = RunnalsMRA(gm,Nr);
RunnalsTime = toc;
disp('Runnals MRA nISE: ')
nISE(gm,gm_Run)

tic;
gm_Was = WassersteinMRA(gm,Nr);
WassersteinTime = toc;
disp('Wasserstein MRA nISE: ')
nISE(gm,gm_Was)

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

tic;
gm_Salm = SalmondMRA(gm,Nr);
disp('Salmond MRA nISE: ')
nISE(gm,gm_Salm)
SalmondTime = toc;

tic;
gm_GMRCWas = GMRCWas(gm,Nr,NKMeansSteps,sk,NOptSteps,optWeights);
disp('GMRCWas MRA nISE: ');
nISE(gm,gm_GMRCWas)
GMRCWasTime = toc;

%%
%gm_Init = GMGen(Nr,n,alpha,beta);
% tic;
% samples = GMSamples(gm,nSamples);
% gm_EM = EM(gm_Run,samples,NEMiter);
% nISE(gm,gm_EM)
% %gm_EM = ISEOpt(gm,gm_EM,sk,NOptSteps,1);
% EMTime = toc;
% disp('EM MRA nISE: ');
% nISE(gm,gm_EM)



%  
%%


 if n==1
      figure(1)
      subplot(2,3,1)
      plotGM1D(gm,X); hold on
      plotGM1D(gm_Salm,X); hold on
      grid minor
      title(strcat('nISE: ',num2str(nISE(gm,gm_Salm)),', Time: ',num2str(SalmondTime),'s'),'FontSize',14);
      legend('Original','Salmond','FontSize',11);
      subplot(2,3,2)
      plotGM1D(gm,X); hold on
      plotGM1D(gm_Williams,X); hold on
      grid minor
      title(strcat('nISE: ',num2str(nISE(gm,gm_Williams)),', Time: ',num2str(WilliamsTime),'s'),'FontSize',14);
      legend('Original','Williams','FontSize',11);
      subplot(2,3,3)
      plotGM1D(gm,X); hold on
      plotGM1D(gm_Run,X); hold on
      grid minor
      title(strcat('nISE: ',num2str(nISE(gm,gm_Run)),', Time: ',num2str(RunnalsTime),'s'),'FontSize',14);
      legend('Original','Runnals','FontSize',11);
      subplot(2,3,4)
      plotGM1D(gm,X); hold on
      plotGM1D(gm_GMRC,X); hold on
      grid minor
      title(strcat('nISE: ',num2str(nISE(gm,gm_GMRC)),', Time: ',num2str(GMRCTime),'s'),'FontSize',14);
      legend('Original','GMRC','FontSize',11);
      subplot(2,3,5)
      plotGM1D(gm,X); hold on
      plotGM1D(gm_Was,X); hold on
      grid minor
      title(strcat('nISE: ',num2str(nISE(gm,gm_Was)),', Time: ',num2str(WassersteinTime),'s'),'FontSize',14);
      legend('Original','Wasserstein','FontSize',11);
      subplot(2,3,6)
      plotGM1D(gm,X); hold on
      plotGM1D(gm_GMRCWas,X); hold on
      grid minor
      title(strcat('nISE: ',num2str(nISE(gm,gm_GMRCWas)),', Time: ',num2str(GMRCWasTime),'s'),'FontSize',14);
      legend('Original','GMRCWas','FontSize',11);
      
      
  
 elseif n==2
%    
     subplot(3,2,1)
     plotGM2D(gm,x1,x2,X); hold on
     title('Original Mixture')
%     subplot(2,3,2)
%     plotGM2D(gm_KI,x1,x2,X);
%     title('KI MRA')
     subplot(3,2,2)
     plotGM2D(gm_Run,x1,x2,X);
     title(strcat('Runnals MRA. nISE: ',num2str(nISE(gm,gm_Run)),', Time: ',num2str(RunnalsTime),'s'));
%     subplot(2,3,4)
%     plotGM2D(gm_Salm,x1,x2,X);
%     title('Salmond MRA')
%     subplot(2,3,5)
%     plotGM2D(gm_Williams,x1,x2,X);
%     title('Williams MRA');
    subplot(3,2,3)
    plotGM2D(gm_GMRC,x1,x2,X);
    title(strcat('GMRC MRA. nISE: ',num2str(nISE(gm,gm_GMRC)),', Time: ',num2str(GMRCTime),'s'));
    
    subplot(3,2,4)
    plotGM2D(gm_Salm,x1,x2,X);
    title(strcat('Salmond MRA. niSE: ', num2str(nISE(gm,gm_Salm)),', Time: ', num2str(SalmondTime),'s'));
    
     subplot(3,2,5)
    plotGM2D(gm_Williams,x1,x2,X);
    title(strcat('Williams MRA. niSE: ', num2str(nISE(gm,gm_Williams)),', Time: ', num2str(WilliamsTime),'s'));
    
      subplot(3,2,6)
    plotGM2D(gm_Was,x1,x2,X);
    title(strcat('Wasserstein MRA. niSE: ', num2str(nISE(gm,gm_Was)),', Time: ', num2str(WassersteinTime),'s'));
 else
     disp(strcat('Runnals MRA. niSE: ', num2str(nISE(gm,gm_Run)),', Time: ', num2str(RunnalsTime),'s'));
     disp(strcat('GMRC MRA. niSE: ', num2str(nISE(gm,gm_GMRC)),', Time: ', num2str(GMRCTime),'s'));
     disp(strcat('EM MRA. niSE: ', num2str(nISE(gm,gm_EM)),', Time: ', num2str(EMTime),'s'));
    
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

 
  