clear

nx=1;%state dimension
N=10;%number of components

%generate random weights, means and covariances
% ws=rand(1,N);
% ws=ws/sum(ws);
% means=10*randn(nx,N);

[ws,means,covs] = paramsFromMixture(testCrouse);

% covs=zeros(nx,nx,N);
invcovs=zeros(nx,nx,N);
invcovsmeans=zeros(nx,N);
for i=1:N
%     sqrtcovs=100*randn(nx);
%     covs(:,:,i)=sqrtcovs*sqrtcovs';
    invcovs(:,:,i)=inv(covs(:,:,i));
    invcovsmeans(:,i)=invcovs(:,:,i)*means(:,i);
end
%initial mu and Sigma
mu=zeros(nx,1);
Sigma=eye(nx);

gamma=zeros(1,N);%allocate updated weights 
mubar=zeros(nx,N);%allocate updated means
covbar=zeros(nx,nx,N);%allocate updated covariances

Niter=1000;%number of iterations
for iter=1:Niter
    muOld=mu;
    SigmaOld=Sigma;
    
    invSigma=inv(Sigma);    
    invSigmamu=invSigma*mu; 
    for i=1:N        
        gamma(i)=ws(i)*mvnpdf(mu,means(:,i),Sigma+covs(:,:,i));%updated weights
        covbar(:,:,i)=inv(invcovs(:,:,i)+invSigma);%updated covariances        
        mubar(:,i)=covbar(:,:,i)*(invcovsmeans(:,i)+invSigmamu);%updated means        
    end                   
    sumgamma=sum(gamma);%normalization constant
    gammabar=gamma/sumgamma;%normalized weights
    
    mu=mubar*gammabar';%new mean
    covtemp=zeros(nx);
    for i=1:N
        covtemp=covtemp+gammabar(i)*(covbar(:,:,i)+(mubar(:,i)-mu)*(mubar(:,i)-mu)');
    end            
    coeff=1/sqrt(det(4*pi*Sigma));%N(mu;mu,2*Sigma)    
    Sigma=(coeff*Sigma/sumgamma+covtemp)/(0.5*coeff/sumgamma+1); %new covariance
    
    consecutiveMeanDistance=norm(muOld-mu);%Difference between consecutive means
    consecutiveCovDistance=trace((SigmaOld-Sigma)^2);%Difference between consecutive covariances
    
    disp(['Mean: ', num2str(consecutiveMeanDistance), '  Covariance: ', num2str(consecutiveCovDistance)]);
end


