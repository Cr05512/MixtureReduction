function bar = alphaJDBarycenter(comps,alpha,maxiter,tol)

if nargin < 2
    alpha = 0.5;
    maxiter = 500;
    tol = 1e-09;
elseif nargin < 3
    maxiter = 500;
    tol = 1e-09;
elseif nargin < 4
    tol = 1e-09;
end

if alpha==1
    bar = RKLDBarycenter(comps);
elseif alpha==0
    bar = FKLDBarycenter(comps);
elseif alpha==0.5
    bar = SKLDBarycenter(comps);
else

    bar = FKLDBarycenter(comps);
    muMPM = (1-alpha)*bar.mu;

    n = length(comps);
    d = size(comps(1).mu,1);


    [wi,mui,Sigmai] = paramsFromMixture(comps);
    sumWi = sum(wi);
    barRKLD = RKLDBarycenter(comps);
    PsiCIinv = alpha*(eye(d)/barRKLD.Sigma);
    muCI = PsiCIinv*barRKLD.mu;
    numIter = 0;
    for k=1:maxiter
        barOld = bar;
        Sigma = bar.Sigma;
        Sigmainv = eye(d)/Sigma;
        
        gammaCI = PsiCIinv + (1-alpha)*Sigmainv;

        mu = (eye(d)/gammaCI) * (muCI + Sigmainv*muMPM);

        PsiMPM = zeros(d,d);

        for i=1:n
            diff = mui(:,i)-mu;
            PsiMPM = PsiMPM + wi(i)*(Sigmai(:,:,i) + diff*diff');
        end
        
        PsiMPM = PsiMPM/sumWi;
        
        gammaMPM = (1-alpha)*PsiMPM + alpha*Sigma;
        
        srGammaCI = chol(gammaCI,'lower');
        srGammaCIinv = eye(d)/srGammaCI;
        
        Sigma = srGammaCIinv'*sqrtm(srGammaCI'*gammaMPM*srGammaCI)*srGammaCIinv;
        
        bar.mu = mu;
        bar.Sigma = real(Sigma);

        if mod(k,3)==0
            if alphaJDij(bar,barOld,alpha)<tol
                break;
            end
        end
        numIter = k;
    end
    if numIter==maxiter
        disp('The JD FPI algorithm did not converge in the allowed iterations.');
    end
end

end

