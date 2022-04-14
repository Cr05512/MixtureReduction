clc
clear
close all

numPoints = 76;

%rng(1001);

gmh = GMGen(2,1,3,0.01);%userDefMixture;

costMeas = 'L2ij';

gmr = FKLDBarycenter(gmh);

mugrid = linspace(-5,8,numPoints);

sigmagrid = linspace(0.05,8,numPoints);



XBAR = zeros(numPoints);


%Jhh = selfLikeness(gmh);

for i=1:numPoints
    gmr.mu = mugrid(i);
    for j=1:numPoints
        gmr.Sigma = sigmagrid(j);
        XBAR(i,j) = evalBarycenterFun(gmh,gmr,costMeas);
    end
end


%%
close all
figure(4)
bar = struct('w',1,'mu',-1,'Sigma',1);%FKLDBarycenter(gmh);
%bar = struct('w',sum([gmh.w]),'mu',-0.3765,'Sigma',0.1);
mesh(mugrid,sigmagrid,XBAR'); hold on
axis([min(mugrid) max(mugrid) min(sigmagrid) max(sigmagrid) 0 max(max(XBAR))])

xlabel('$\mu$','FontSize',34,'Interpreter','latex');
ylabel('$\Sigma$','FontSize',34,'Interpreter','latex');
zlabel('$m_{}(\nu)$','FontSize',34,'Interpreter','latex');
title('$D_{}$-barycenter','FontSize',54,'Interpreter','latex'); hold on
barVal = evalBarycenterFun(gmh,bar,costMeas);
h = scatter3(bar.mu,bar.Sigma,barVal,50,'ro','MarkerFaceColo','r','LineWidth',6,'SizeData',300);
pause()

d = size(gmh(1).mu,1);
n = numel(gmh);
muVec = zeros(d,n);
SigmaVec = zeros(d,d,n);
[wi,mui,Sigmai] = paramsFromMixture(gmh);
Sigmaiinv = zeros(d,d,n);
Sigmaiinvmu = zeros(d,n);
for i=1:n
    Sigmaiinv(:,:,i) = eye(d)/Sigmai(:,:,i);
    Sigmaiinvmu(:,i) = Sigmaiinv(:,:,i)*mui(:,i);
end


for k=1:500
    mu = bar.mu;
    Sigma = bar.Sigma;
    Sigmainv = eye(d)/Sigma;
    Jrr = 1/sqrt((4*pi)^d * det(Sigma));
    Jir = matrixUnwCrossLikeness(mui,Sigmai,mu,Sigma);
    wc1 = -2.*wi.*Jir;
    wc2 = wi.*Jrr;
    for i=1:n
        SigmaVec(:,:,i) = eye(d)/(Sigmaiinv(:,:,i) + Sigmainv); 
        muVec(:,i) = SigmaVec(:,:,i)*(Sigmaiinvmu(:,i) + Sigmainv*mu);
    end
    

    wc1bar = sum(wc1);
    wc2bar = sum(wc2);
    
    mu = 1/wc1bar * muVec * wc1;
    
    diffs = muVec-mu;
    
    P = zeros(d,d);
    
    for i=1:n
        P = P + wc1(i)*(SigmaVec(:,:,i) + diffs(:,i)*diffs(:,i)');
    end
    
    %Sigma = P/(wc1bar + wc2bar);
    Sigma = P/wc1bar -wc2bar/wc1bar * Sigma;
    
    bar.mu = mu;
    bar.Sigma = Sigma;
    barVal = evalBarycenterFun(gmh,bar,costMeas);
    delete(h)
    h = scatter3(bar.mu,bar.Sigma,barVal,50,'ro','MarkerFaceColo','r','LineWidth',6,'SizeData',300);
    pause(0.1);

    
end
