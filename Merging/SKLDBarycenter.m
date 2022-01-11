function bar = SKLDBarycenter(comps,gamma,maxiter,tol)

if nargin < 2
    gamma = 0.5;
    maxiter = 100;
    tol = 1e-12;
elseif nargin < 3
    maxiter = 100;
    tol = 1e-12;
elseif nargin < 4
    tol = 1e-12;
end


bar = KLDBarycenter(comps);
barnew = bar;

n = length(comps);
d = size(comps(1).mu,1);

wSigmaVec = zeros(d,d,n);
wSigmamuVec = zeros(d,n);

[wi,mui,Sigmai] = paramsFromMixture(comps);

Sigmaiinv = zeros(d,d,n);
for i=1:n
    Sigmaiinv(:,:,i) = eye(d)/Sigmai(:,:,i);
end


for k=1:maxiter
    Sigma = bar.Sigma;
    Sigmainv = eye(d)/Sigma;
    
    for i=1:n
        wSigmaVec(:,:,i) = wi(i)*(Sigmaiinv(:,:,i) + Sigmainv);
        wSigmamuVec(:,i) = wSigmaVec(:,:,i)*mui(:,i);
    end
    
    mu = sum(wSigmaVec,3)\sum(wSigmamuVec,2);
    
    diffs = mui-mu;
    
    PsiMPM = zeros(d,d);
    PsiCIinv = zeros(d,d);
    
    for i=1:n
        PsiCIinv = PsiCIinv + wi(i)*Sigmaiinv(:,:,i);
        PsiMPM = PsiMPM + wi(i)*(Sigmai(:,:,i) + diffs(:,i)*diffs(:,i)');
    end
    
    Sigma = gamma*eye(d)/PsiCIinv*(Sigmainv*PsiMPM ) + (1-gamma)*Sigma;
    
    
    
    barnew.mu = mu;
    barnew.Sigma = Sigma;
    

    if SKLDij(barnew,bar)<tol
        bar = barnew;
        break;
    end
    bar=barnew;
end

end

