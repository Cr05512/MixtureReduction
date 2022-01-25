function bar = alphaJDBarycenter(comps,alpha,maxiter,tol)

if nargin < 2
    alpha = 0.5;
    maxiter = 500;
    tol = 1e-06;
elseif nargin < 3
    maxiter = 500;
    tol = 1e-06;
elseif nargin < 4
    tol = 1e-06;
end

if alpha==0
    bar = RKLDBarycenter(comps);
elseif alpha==1
    bar = FKLDBarycenter(comps);
else

    bar = FKLDBarycenter(comps);

    n = length(comps);
    d = size(comps(1).mu,1);

    wSigmaVec = zeros(d,d,n);
    wSigmamuVec = zeros(d,n);

    [wi,mui,Sigmai] = paramsFromMixture(comps);
    sumWi = sum(wi);
    Sigmaiinv = zeros(d,d,n);
    PsiCIinv = zeros(d,d);
    for i=1:n
        Sigmaiinv(:,:,i) = eye(d)/Sigmai(:,:,i);
        PsiCIinv = PsiCIinv + wi(i)*Sigmaiinv(:,:,i);
    end
    PsiCIinv = 1/sumWi * PsiCIinv;
%     %
%     srPsiCIinv = sqrtm(PsiCIinv);
%     srPsiCI = eye(d)/srPsiCIinv;


    for k=1:maxiter
        barOld = bar;
        Sigma = bar.Sigma;
        Sigmainv = eye(d)/Sigma;

        for i=1:n
            wSigmaVec(:,:,i) = wi(i)*(alpha*Sigmaiinv(:,:,i) + (1-alpha)*Sigmainv);
            wSigmamuVec(:,i) = wSigmaVec(:,:,i)*mui(:,i);
        end

        mu = sum(wSigmaVec,3)\sum(wSigmamuVec,2);

        diffs = mui-mu;

        PsiMPM = zeros(d,d);

        for i=1:n
            PsiMPM = PsiMPM + wi(i)*(Sigmai(:,:,i) + diffs(:,i)*diffs(:,i)');
        end
        
        PsiMPM = PsiMPM/sumWi;
        %Sigma = srPsiCI*sqrtm(srPsiCIinv*(alpha/(1-alpha)*PsiMPM + sumWi*(1-alpha/(1-alpha))*Sigma)*srPsiCIinv)*srPsiCI;
        %Sigma = sqrtm(PsiMPM)*srPsiCI;
        gammaCI = alpha*PsiCIinv + (1-alpha)*Sigmainv;
        gammaMPM = (1-alpha)*PsiMPM + alpha*Sigma;
        
        srGammaCI = chol(gammaCI,'lower');
        srGammaCIinv = eye(d)/srGammaCI;
        
        Sigma = srGammaCIinv'*sqrtm(srGammaCI'*gammaMPM*srGammaCI)*srGammaCIinv;
        
        bar.mu = mu;
        bar.Sigma = Sigma;

        if mod(k,10)==1
            if alphaJDij(bar,barOld,alpha)<tol
                break;
            end
        end

    end
    if k==maxiter
        disp('The JD FPI algorithm did not converge in the allowed iterations.');
    end
end

end

