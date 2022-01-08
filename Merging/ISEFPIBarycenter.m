function bar = ISEFPIBarycenter(comps,maxiter,tol)

if nargin < 2
    maxiter = 100;
    tol = 1e-12;
elseif nargin < 3
    tol = 1e-12;
end

bar = RKLDBarycenter(comps);
bar.Sigma = 0.01;
barnew = bar;
n = length(comps);
d = size(comps(1).mu,1);

wVec = zeros(n,1);
muVec = zeros(d,n);
SigmaVec = zeros(d,d,n);
wSigmaVec = SigmaVec;
[wi,mui,Sigmai] = paramsFromMixture(comps);
normFactor = sum(wi);
Sigmaiinv = zeros(d,d,n);
for i=1:n
    Sigmaiinv(:,:,i) = eye(d)/Sigmai(:,:,i);
end

for k=1:maxiter
    mu = bar.mu;
    Sigma = bar.Sigma;
    Sigmainv = eye(d)/Sigma;
    Jrr = 1/sqrt(det(4*pi*Sigma));

    for i=1:n
        SigmaVec(:,:,i) = eye(d)/(Sigmaiinv(:,:,i) + Sigmainv);
        muVec(:,i) = SigmaVec(:,:,i)*(Sigmaiinv(:,:,i)*mui(:,i) + Sigmainv*mu);
        wVec(i) = wi(i)*mvnpdf(mui(:,i),mu,Sigmai(:,:,i)+Sigma);
        wSigmaVec(:,:,i) = wVec(i)*SigmaVec(:,:,i);
    end
    

    barnew.mu = sum(wVec'.*muVec,2)/sum(wVec);
    
    barnew.Sigma = (sum(wSigmaVec,3) - normFactor*Jrr*bar.Sigma)/sum(wVec);
    
    
    if ISE(barnew,bar)<tol
        bar=barnew;
        break;
    end
    
    bar=barnew;
    
end

end

