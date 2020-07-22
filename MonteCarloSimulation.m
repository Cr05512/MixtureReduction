clc
clear
close all

Nh = 70;  %Full mixture component number
Nr = 10;   %Reduced mixture component number
n = 1;    %Dimension
nPoints = 300;  %Evaluation points per dimension 
alpha = 2.5;  %Mean spreading factor
beta = 2; %Covariance tuning parameter
nSamples = Nr*1000;
NKMeansSteps = 20;
sk = 0.005; %Gradient step
NOptSteps = 30; %Gradient iterations
NEMiter = 10;
optWeights = 1; %flag to optimize weights or not
NumTests = 10;

nISEVector = zeros(2,NumTests);
timeVector = zeros(2,NumTests);
W2Vector = zeros(2,NumTests);

for m = 1:NumTests
    
    gm = GMGen(Nh,n,alpha,beta);
%     
%     tic;
%     [gm_GMRC, nISETrajGMRC] = GMRC(gm,Nr,NKMeansSteps,sk,NOptSteps,optWeights);
%     GMRCTime = toc;
%     nISEVector(1,m) = nISE(gm,gm_GMRC);
%     timeVector(1,m) = GMRCTime;
%     %disp('GMRC MRA nISE: ')
%     %nISE(gm,gm_GMRC)
%     
%     tic;
%     gm_Williams = WilliamsMRA(gm,Nr);
%     gm_Williams = ISEOpt(gm,gm_Williams,sk,NOptSteps,optWeights);
%     WilliamsTime = toc;
%     nISEVector(4,m) = nISE(gm,gm_Williams);
%     timeVector(4,m) = WilliamsTime;

%     tic;
%     gm_GMRCWas = GMRCWas(gm,Nr,NKMeansSteps,sk,NOptSteps,optWeights);
%     GMRCWasTime = toc;
%     nISEVector(2,m) = nISE(gm,gm_GMRCWas);
%     timeVector(2,m) = GMRCWasTime;
%     %disp('Runnals MRA nISE: ')
%     %nISE(gm,gm_Run)
%     
%     tic;
%     gm_Salm = SalmondMRA(gm,Nr);
%     SalmondTime = toc;
%     %disp('Salmond MRA nISE: ')
%     nISEVector(3,m) = nISE(gm,gm_Salm);
%     timeVector(3,m) = SalmondTime;

    tic;
    gm_Was = WassersteinMRA(gm,Nr);
    WassersteinTime = toc;
    nISEVector(1,m) = nISE(gm,gm_Was);
    timeVector(1,m) = WassersteinTime;
    W2Vector(1,m) = GMWassersteinDistance(gm,gm_Was);
    
    tic;
    gm_Run = RunnalsMRA(gm,Nr);
    RunnalsTime = toc;
    nISEVector(2,m) = nISE(gm,gm_Run);
    timeVector(2,m) = RunnalsTime;
    W2Vector(2,m) = GMWassersteinDistance(gm,gm_Run);
    
    
%     tic;
%     samples = GMSamples(gm,nSamples);
%     gm_EM = EM(gm_Run,samples,NEMiter);
%     %nISE(gm,gm_EM)
%     %gm_EM = ISEOpt(gm,gm_EM,sk,NOptSteps,1);
%     EMTime = toc;
%     nISEVector(3,m) = nISE(gm,gm_EM);
%     timeVector(3,m) = EMTime + RunnalsTime;
    %disp('EM MRA nISE: ');
    %nISE(gm,gm_EM)

    
end

avgnISE = sum(nISEVector,2)./NumTests
avgTime = sum(timeVector,2)./NumTests
avgW2 = sum(W2Vector,2)./NumTests
