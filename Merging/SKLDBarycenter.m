function bar = SKLDBarycenter(comps,maxiter,tol)

if nargin < 2
    maxiter = 500;
    tol = 1e-09;
elseif nargin < 3
    tol = 1e-09;
end


bar = FKLDBarycenter(comps);

n = length(comps);
d = size(comps(1).mu,1);

wSigmaVec = zeros(d,d,n);
wSigmamuVec = zeros(d,n);

[wi,mui,Sigmai] = paramsFromMixture(comps);

Sigmaiinv = zeros(d,d,n);
PsiCIinv = zeros(d,d);
for i=1:n
    Sigmaiinv(:,:,i) = eye(d)/Sigmai(:,:,i);
    PsiCIinv = PsiCIinv + wi(i)*Sigmaiinv(:,:,i);
end
%
srPsiCIinv = sqrtm(PsiCIinv);
srPsiCI = eye(d)/srPsiCIinv;


for k=1:maxiter
    barOld = bar;
    Sigma = bar.Sigma;
    Sigmainv = eye(d)/Sigma;
    
    for i=1:n
        wSigmaVec(:,:,i) = wi(i)*(Sigmaiinv(:,:,i) + Sigmainv);
        wSigmamuVec(:,i) = wSigmaVec(:,:,i)*mui(:,i);
    end
    
    mu = sum(wSigmaVec,3)\sum(wSigmamuVec,2);
    
    diffs = mui-mu;
    
    PsiMPM = zeros(d,d);

    for i=1:n
        PsiMPM = PsiMPM + wi(i)*(Sigmai(:,:,i) + diffs(:,i)*diffs(:,i)');
    end

    Sigma = srPsiCI*sqrtm(srPsiCIinv*PsiMPM*srPsiCIinv)*srPsiCI;
    %Sigma = sqrtm(PsiMPM)*srPsiCI;
    
    bar.mu = mu;
    bar.Sigma = Sigma;
    
    if mod(k,10)==1
        if SKLDij(bar,barOld)<tol
            break;
        end
    end

end
if k==maxiter
    disp('The SKLD FPI algorithm did not converge in the allowed iterations.');
end

end

