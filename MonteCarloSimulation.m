clc
clear
close all

Nh = 20;  %Full mixture component number
Nr = 5;   %Reduced mixture component number
n = 1;    %Dimension
nPoints = 300;  %Evaluation points per dimension 
alpha = 2.5;  %Mean spreading factor
beta = 1; %Covariance tuning parameter
nSamples = Nr*1250;
NKMeansSteps = 20;
sk = 0.005; %Gradient step
NOptSteps = 30; %Gradient iterations
NEMiter = 30;
optWeights = 1; %flag to optimize weights or not
NumTests = 1;

nISEVector = zeros(3,NumTests);
timeVector = zeros(3,NumTests);

for m = 1:NumTests
    
    gm = GMGen(Nh,n,alpha,beta);
    
    tic;
    [gm_GMRC, nISETrajGMRC] = GMRC(gm,Nr,NKMeansSteps,sk,NOptSteps,optWeights);
    GMRCTime = toc;
    nISEVector(1,m) = nISE(gm,gm_GMRC);
    timeVector(1,m) = GMRCTime;
    %disp('GMRC MRA nISE: ')
    %nISE(gm,gm_GMRC)

    tic;
    gm_Run = RunnalsMRA(gm,Nr);
    RunnalsTime = toc;
    nISEVector(2,m) = nISE(gm,gm_Run);
    timeVector(2,m) = RunnalsTime;
    %disp('Runnals MRA nISE: ')
    %nISE(gm,gm_Run)
    
    tic;
    samples = GMSamples(gm,nSamples);
    gm_EM = EM(gm_Run,samples,NEMiter);
    %nISE(gm,gm_EM)
    %gm_EM = ISEOpt(gm,gm_EM,sk,NOptSteps,1);
    EMTime = toc;
    nISEVector(3,m) = nISE(gm,gm_EM);
    timeVector(3,m) = EMTime + RunnalsTime;
    %disp('EM MRA nISE: ');
    %nISE(gm,gm_EM)

    
end

avgnISE = sum(nISEVector,2)./NumTests
avgTime = sum(timeVector,2)./NumTests
