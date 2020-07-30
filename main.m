clc
clear
close all


%Parameters to play with
global Nh Nr n alpha
Nh = 16;  %Full mixture component number
Nr = 5;   %Reduced mixture component number
r = 8;
n = 1;    %Dimension
nPoints = 300;  %Evaluation points per dimension 
alpha = 2.8;  %Mean spreading factor
beta = 2; %Covariance tuning parameter
nSamples = Nr*1500;
NKMeansSteps = 20;
sk = 0.005; %Gradient step
NOptSteps = 50; %Gradient iterations
NEMiter = 10;
optWeights = 1; %flag to optimize weights or not
cost_measure = 'L2'; %cost measure used to compute the cost matrix in the Composite transportation distance


gm = GMGen(Nh,n,alpha,beta);
%gm = test4CompGen(Nh,r);
%gm = testWilliamsCompGen();
%gm = testRunnalsCompGen();
%gm = test5CompGen();
%gm = testCrouseCompGen();
%%

if n==1
    [maxMu,indMax] = max([gm.mu]);
    [minMu,indMin] = min([gm.mu]);
    maxSigma = max([gm.Sigma]);
    center = (maxMu-minMu)/2;
    
    X = linspace(-(abs(minMu) + 1.5*sqrt(maxSigma) + center), (abs(maxMu) + 1.5*sqrt(maxSigma) + center),nPoints);
elseif n==2
    x1 = linspace(-2*alpha^3, 2*alpha^3,nPoints);
    x2 = linspace(-2*alpha^3, 2*alpha^3,nPoints);
    [X1,X2] = meshgrid(x1,x2);
    X = [X1(:) X2(:)];

end



tic;
gm_Williams = WilliamsMRA(gm,Nr);
[gm_Williams, nISETrajWilliams] = ISEOpt(gm,gm_Williams,sk,NOptSteps,optWeights);
WilliamsTime = toc;
disp('Williams MRA nISE: ')
nISE(gm,gm_Williams)

tic;
gm_KI = KIDivergenceMRA(gm,Nr);
%disp('KI MRA nISE: ')
%nISE(gm,gm_KI)
KIDTime = toc;
%%
tic;
[gm_GMRC,nISETrajGMRC] = GMRC(gm,Nr,NKMeansSteps,sk,NOptSteps,optWeights);
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


tic;
gm_Salm = SalmondMRA(gm,Nr);
SalmondTime = toc;
disp('Salmond MRA nISE: ')
nISE(gm,gm_Salm)


tic;
gm_GMRCWas = GMRCWas(gm,Nr,NKMeansSteps);
GMRCWasTime = toc;
disp('GMRCWas MRA nISE: ');
nISE(gm,gm_GMRCWas)

%%
tic;
gm_ARKLD = ARKLDMRA(gm,Nr);
ARKLDTime = toc;
disp('ARKLD MRA nISE: ')
nISE(gm,gm_ARKLD)


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
      subplot(3,3,1)
      plotGM1D(gm,X); hold on
      plotGM1D(gm_Salm,X); hold on
      grid minor
      title(strcat('nISE: ',num2str(nISE(gm,gm_Salm)),' CTD',cost_measure,': ',num2str(CTD(gm,gm_Salm,cost_measure)),' Time: ',num2str(SalmondTime),'s'),'FontSize',14);
      legend('Original','Salmond','FontSize',11);
      subplot(3,3,2)
      plotGM1D(gm,X); hold on
      plotGM1D(gm_Williams,X); hold on
      grid minor
      title(strcat('nISE: ',num2str(nISE(gm,gm_Williams)),' CTD',cost_measure,': ',num2str(CTD(gm,gm_Williams,cost_measure)),', Time: ',num2str(WilliamsTime),'s'),'FontSize',14);
      legend('Original','Williams','FontSize',11);
      subplot(3,3,3)
      plotGM1D(gm,X); hold on
      plotGM1D(gm_Run,X); hold on
      grid minor
      title(strcat('nISE: ',num2str(nISE(gm,gm_Run)),' CTD',cost_measure,': ',num2str(CTD(gm,gm_Run,cost_measure)),', Time: ',num2str(RunnalsTime),'s'),'FontSize',14);
      legend('Original','Runnals','FontSize',11);
      subplot(3,3,4)
      plotGM1D(gm,X); hold on
      plotGM1D(gm_GMRC,X); hold on
      grid minor
      title(strcat('nISE: ',num2str(nISE(gm,gm_GMRC)),' CTD',cost_measure,': ',num2str(CTD(gm,gm_GMRC,cost_measure)),', Time: ',num2str(GMRCTime),'s'),'FontSize',14);
      legend('Original','GMRC','FontSize',11);
      subplot(3,3,5)
      plotGM1D(gm,X); hold on
      plotGM1D(gm_Was,X); hold on
      grid minor
      title(strcat('nISE: ',num2str(nISE(gm,gm_Was)),' CTD',cost_measure,': ',num2str(CTD(gm,gm_Was,cost_measure)),', Time: ',num2str(WassersteinTime),'s'),'FontSize',14);
      legend('Original','Wasserstein','FontSize',11);
      subplot(3,3,6)
      plotGM1D(gm,X); hold on
      plotGM1D(gm_GMRCWas,X); hold on
      grid minor
      title(strcat('nISE: ',num2str(nISE(gm,gm_GMRCWas)),' CTD',cost_measure,': ',num2str(CTD(gm,gm_GMRCWas,cost_measure)),', Time: ',num2str(GMRCWasTime),'s'),'FontSize',14);
      legend('Original','GMRCWas','FontSize',11);
      subplot(3,3,7)
      plotGM1D(gm,X); hold on
      plotGM1D(gm_ARKLD,X); hold on
      grid minor
      title(strcat('nISE: ',num2str(nISE(gm,gm_ARKLD)),' CTD',cost_measure,': ',num2str(CTD(gm,gm_ARKLD,cost_measure)),', Time: ',num2str(ARKLDTime),'s'),'FontSize',14);
      legend('Original','ARKLD','FontSize',11);
      subplot(3,3,8)
      plotGM1D(gm,X); hold on
      plotGM1D(gm_KI,X); hold on
      grid minor
      title(strcat('nISE: ',num2str(nISE(gm,gm_KI)),' CTD',cost_measure,': ',num2str(CTD(gm,gm_KI,cost_measure)),', Time: ',num2str(KIDTime),'s'),'FontSize',14);
      legend('Original','KI','FontSize',11);

      
      
  
 elseif n==2
%    
     subplot(3,3,1)
     plotGM2D(gm,x1,x2,X); hold on
     title('Original Mixture')

     subplot(3,3,2)
     plotGM2D(gm_Run,x1,x2,X);
     title(strcat('Runnals MRA ',' nISE: ',num2str(nISE(gm,gm_Run)),' CTD',cost_measure,': ',num2str(CTD(gm,gm_Run,cost_measure)),', Time: ',num2str(RunnalsTime),'s'));

    subplot(3,3,3)
    plotGM2D(gm_GMRC,x1,x2,X);
    title(strcat('GMRC MRA ',' nISE: ',num2str(nISE(gm,gm_GMRC)),' CTD',cost_measure,': ',num2str(CTD(gm,gm_GMRC,cost_measure)),', Time: ',num2str(GMRCTime),'s'));
    
    subplot(3,3,4)
    plotGM2D(gm_Salm,x1,x2,X);
    title(strcat('Salmond MRA ',' nISE: ',num2str(nISE(gm,gm_Salm)),' CTD',cost_measure,': ',num2str(CTD(gm,gm_Salm,cost_measure)),', Time: ',num2str(SalmondTime),'s'));
    
    subplot(3,3,5)
    plotGM2D(gm_Williams,x1,x2,X);
    title(strcat('Williams MRA ',' nISE: ',num2str(nISE(gm,gm_Williams)),' CTD',cost_measure,': ',num2str(CTD(gm,gm_Williams,cost_measure)),', Time: ',num2str(WilliamsTime),'s'));
    
    subplot(3,3,6)
    plotGM2D(gm_Was,x1,x2,X);
    title(strcat('Wasserstein MRA ',' nISE: ',num2str(nISE(gm,gm_Was)),' CTD',cost_measure,': ',num2str(CTD(gm,gm_Was,cost_measure)),', Time: ',num2str(WassersteinTime),'s'));

    subplot(3,3,7)
    plotGM2D(gm_ARKLD,x1,x2,X);
    title(strcat('ARKLD MRA. niSE: ', num2str(nISE(gm,gm_ARKLD)),' CTD',cost_measure,': ',num2str(CTD(gm,gm_Was,cost_measure)),', Time: ', num2str(ARKLDTime),'s'));

 else
     disp(strcat('Williams MRA ',' nISE: ',num2str(nISE(gm,gm_Williams)),' CTD',cost_measure,': ',num2str(CTD(gm,gm_Williams,cost_measure)),', Time: ',num2str(WilliamsTime),'s'));
     disp(strcat('Salmond MRA ',' nISE: ',num2str(nISE(gm,gm_Salm)),' CTD',cost_measure,': ',num2str(CTD(gm,gm_Salm,cost_measure)),', Time: ',num2str(SalmondTime),'s'));
     disp(strcat('Runnals MRA ',' nISE: ',num2str(nISE(gm,gm_Run)),' CTD',cost_measure,': ',num2str(CTD(gm,gm_Run,cost_measure)),', Time: ',num2str(RunnalsTime),'s'));
     disp(strcat('GMRC MRA ',' nISE: ',num2str(nISE(gm,gm_GMRC)),' CTD',cost_measure,': ',num2str(CTD(gm,gm_GMRC,cost_measure)),', Time: ',num2str(GMRCTime),'s'));
     disp(strcat('Wasserstein MRA ',' nISE: ',num2str(nISE(gm,gm_Was)),' CTD',cost_measure,': ',num2str(CTD(gm,gm_Was,cost_measure)),', Time: ',num2str(WassersteinTime),'s'));
     
    
 end

 
  