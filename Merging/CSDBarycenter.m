function bar = CSDBarycenter(comps,maxiter,tol)

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
    for i=1:n
        SigmaVec(:,:,i) = eye(d)/(Sigmaiinv(:,:,i) + Sigmainv); 
        muVec(:,i) = SigmaVec(:,:,i)*(Sigmaiinvmu(:,i) + Sigmainv*mu);
    end
    
    
    mu = 1/wiSum * muVec * wi;
    
    diffs = muVec-mu;
    
    P = zeros(d,d);
    
    for i=1:n
        P = P + wi(i)*(SigmaVec(:,:,i) + diffs(:,i)*diffs(:,i)');
    end
    
    Sigma = 2/wiSum * P;
    %Sigma=(Jrr*Sigma/normFactor+P)/(0.5*Jrr/normFactor+1); %new covariance
    
    barnew.mu = mu;
    barnew.Sigma = Sigma;
    
    
    if mod(k,5)==1
        if CSDij(barnew,bar)<tol
            bar=barnew;
            break;
        end
    end
    bar=barnew;
end

end

