function bar = SKLDBarycenter(comps,maxiter,tol)

if nargin < 2
    maxiter = 500;
    tol = 1e-09;
elseif nargin < 3
    tol = 1e-09;
end


bar = FKLDBarycenter(comps);
muMPM = bar.mu;
%      [~,idx] = max([comps.w]);
%      bar = comps(idx);
%      bar.w = sum([comps.w]);

n = length(comps);
d = size(comps(1).mu,1);

[wi,mui,Sigmai] = paramsFromMixture(comps);
sumWi = sum(wi);
barRKLD = RKLDBarycenter(comps);
PsiCIinv = eye(d)/barRKLD.Sigma;
muCI = PsiCIinv*barRKLD.mu;
srPsiCIinv = sqrtm(PsiCIinv);
srPsiCI = eye(d)/srPsiCIinv;

numIter = 0;

for k=1:maxiter
    barOld = bar;
    Sigma = bar.Sigma;
    Sigmainv = eye(d)/Sigma;
    
    mu = (eye(d)/(PsiCIinv+Sigmainv))*(muCI+Sigmainv*muMPM);
    
    
    PsiMPM = zeros(d,d);

    for i=1:n
        diff = mui(:,i)-mu;
        PsiMPM = PsiMPM + wi(i)*(Sigmai(:,:,i) + diff*diff');
    end
    PsiMPM = PsiMPM/sumWi;
    Sigma = srPsiCI*sqrtm(srPsiCIinv*PsiMPM*srPsiCIinv)*srPsiCI;
    %Sigma = sqrtm(PsiMPM)*srPsiCI;
    
    bar.mu = mu;
    bar.Sigma = real(Sigma);
    
    if mod(k,3)==0
        if SKLDij(bar,barOld)<tol
            break;
        end
    end
    numIter = k;
end
if numIter==maxiter
    disp('The SKLD FPI algorithm did not converge in the allowed iterations.');
end

end

