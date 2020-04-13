clc
clear
close all

global plotTotalGM plotComponents
plotTotalGM = 1;
plotComponents = 0;
getSamples = 0;

%Parameters to play with
Nh = 20;  %Full mixture component number
Nr = 4;   %Reduced mixture component number
n = 1;    %Dimension
nPoints = 300;  %Evaluation points per dimension 
alpha = 2.5;  %Auxiliary factors
beta = 1;
nSamples = 1000;
NKMeansSteps = 10;
sk = 0.001; %Gradient step
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
    X = linspace(-4*alpha^3, 4*alpha^3,nPoints);
else
    x1 = linspace(-2*alpha^3, 2*alpha^3,nPoints);
    x2 = linspace(-2*alpha^3, 2*alpha^3,nPoints);
    [X1,X2] = meshgrid(x1,x2);
    X = [X1(:) X2(:)];

end

gm = GMGen(w_bar,mu,Sigma);

%gm_Williams = WilliamsMRA(gm,Nr);
%disp('Williams MRA nISE: ')
%nISE(gm,gm_Williams)


%gm_KI = KIDivergenceMRA(gm,Nr);
%disp('KI MRA nISE: ')
%nISE(gm,gm_KI)

gm_Run = RunnalsMRA(gm,Nr);
disp('Runnals MRA nISE: ')
nISE(gm,gm_Run)

[gm_Run_Opt, nISETraj] = ISEOpt(gm,gm_Run,sk,NOptSteps,optWeights);
disp('Runnals Optimized MRA nISE: ')
nISE(gm,gm_Run_Opt)

%gm_Salm = SalmondMRA(gm,Nr);
%disp('Salmond MRA nISE: ')
%nISE(gm,gm_Salm)

gm_GMRC = GMRC(gm,Nr,NKMeansSteps,sk,NOptSteps,optWeights);
disp('GMRC MRA nISE: ')
nISE(gm,gm_GMRC)
 
if getSamples==1
    samples = GMSamples(gm, nSamples);
end


 if n==1
      figure(1)
      plotGM1D(gm,X); hold on
      %plotGM1D(gm_KI,X); hold on
      plotGM1D(gm_Run,X); hold on
      %plotGM1D(gm_Salm,X); hold on
      %plotGM1D(gm_Williams,X); hold on
      plotGM1D(gm_Run_Opt,X); hold on
      plotGM1D(gm_GMRC,X); hold on
      grid minor
% %     
     legend('Original Mixture','Runnals MRA','Optimized Runnals','GMRC MRA');
%     legend('Original Mixture','KI MRA','Runnals MRA','Salmond MRA','Williams MRA','Optimized Runnals');
%else
%    
%     subplot(2,3,1)
%     plotGM2D(gm,x1,x2,X); hold on
%     title('Original Mixture')
%     subplot(2,3,2)
%     plotGM2D(gm_KI,x1,x2,X);
%     title('KI MRA')
%     subplot(2,3,3)
%     plotGM2D(gm_Run,x1,x2,X);
%     title('Runnals MRA')
%     subplot(2,3,4)
%     plotGM2D(gm_Salm,x1,x2,X);
%     title('Salmond MRA')
%     subplot(2,3,5)
%     plotGM2D(gm_Williams,x1,x2,X);
%     title('Williams MRA');
%     
 end

  