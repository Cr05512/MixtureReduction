function bar = NISEBarycenter(comps,maxiter,tol)

if nargin < 2
    maxiter = 150;
    tol = 1e-12;
elseif nargin < 3
    tol = 1e-12;
end

n = length(comps);
d = size(comps(1).mu,1);

bar = KLDBarycenter(comps);
barnew = bar;


wVec = zeros(n,1);
muVec = zeros(d,n);
SigmaVec = zeros(d,d,n);
[wi,mui,Sigmai] = paramsFromMixture(comps);
wiSum = sum(wi);
Sigmaiinv = zeros(d,d,n);
Sigmaiinvmu = zeros(d,n);
for i=1:n
    Sigmaiinv(:,:,i) = eye(d)/Sigmai(:,:,i);
    Sigmaiinvmu(:,i) = Sigmaiinv(:,:,i)*mui(:,i);
end

for k=1:maxiter
    mu = bar.mu;
    Sigma = bar.Sigma;
    Sigmainv = eye(d)/Sigma;
    Jrr = 1/sqrt((4*pi)^d * det(Sigma));
    for i=1:n
        wVec(i) = wi(i)*mvnpdf(mui(:,i),mu,Sigmai(:,:,i)+Sigma);
        SigmaVec(:,:,i) = eye(d)/(Sigmaiinv(:,:,i) + Sigmainv); 
        muVec(:,i) = SigmaVec(:,:,i)*(Sigmaiinvmu(:,i) + Sigmainv*mu);
    end
    

    normFactor = sum(wVec);
    
    mu = 1/normFactor * muVec * wVec;
    
    diffs = muVec-mu;
    
    P = zeros(d,d);
    
    for i=1:n
        P = P + wVec(i)*(SigmaVec(:,:,i) + diffs(:,i)*diffs(:,i)');
    end
    
    Sigma = P/(normFactor - 0.5*wiSum*Jrr);
    %Sigma=(Jrr*Sigma/normFactor+P)/(0.5*Jrr/normFactor+1); %new covariance
    
    barnew.mu = mu;
    barnew.Sigma = Sigma;
    
    
    if mod(k,5)==1
        if L2ij(barnew,bar)<tol
            bar=barnew;
            break;
        end
    end
    bar=barnew;
    
end

end

