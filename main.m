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
n = 1;    %Dimension
nPoints = 300;  %Evaluation points per dimension 
alpha = 2;  %Auxiliary factors
beta = 2;
nSamples = 1000;

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

gm_KI = KIDivergenceMRA(gm,Nr);

disp('KI MRA nISE: ')
nISE(gm,gm_KI)

gm_Run = RunnalsMRA(gm,Nr);

disp('Runnals MRA nISE: ')
nISE(gm,gm_Run)

if getSamples==1
    samples = GMSamples(gm, nSamples);
end


figure(1)
if n==1
    plotGM1D(gm,X); hold on
    plotGM1D(gm_KI,X); hold on
    plotGM1D(gm_Run,X); hold on
    grid minor
    
    legend('Original Mixture','KI MR','Runnals MR');
else
   
    subplot(2,2,1)
    plotGM2D(gm,x1,x2,X); hold on
    title('Original Mixture')
    subplot(2,2,2)
    plotGM2D(gm_KI,x1,x2,X);
    title('KI MR')
    subplot(2,2,3)
    title('Runnals MR')
    plotGM2D(gm_Run,x1,x2,X);
    
end
