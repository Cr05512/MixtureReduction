function bar =  CSDBarycenter(gmh,maxiter,tol)
if nargin < 2
    maxiter = 100;
    tol = 1e-10;
elseif nargin < 3
    tol = 1e-10;
end

bar = KLDBarycenter(gmh);

mu = bar.mu;
Sigma = bar.Sigma;
mu_prev = mu;
Sigma_prev = Sigma;
N = numel(gmh);
d = size(mu,1);

[wh,muh,Sigmah] = paramsFromMixture(gmh);

wh = wh./sum(wh);

Sigmahinv = zeros(d,d,N);
wSigmahinv = Sigmahinv;

for k=1:maxiter
    muTmp = zeros(d,1);
    A = zeros(d,d);
    for i=1:N
        Sigmahinv(:,:,i) = eye(d)/(Sigma+Sigmah(:,:,i));
        wSigmahinv(:,:,i) = wh(i)*Sigmahinv(:,:,i);
        muTmp = muTmp + wSigmahinv(:,:,i)*muh(:,i);
    end
    mu = sum(wSigmahinv,3)\muTmp;
    
    for i=1:N
        diff = mu - muh(:,i);
        A = A + wh(i)*2*d*(Sigmahinv(:,:,i) - 0.5*Sigmahinv(:,:,i)*diff*diff'*Sigmahinv(:,:,i));
    end
    
    B = A + A' - diag(A);
    Sigma = 2*d*eye(d)/(B + diag(B));
    
    if ~mod(k,10)
        if norm(mu-mu_prev)<tol && norm(Sigma-Sigma_prev)<tol
            break;
        end
    end
    mu_prev = mu;
    Sigma_prev = Sigma;
end

bar.mu = mu;
bar.Sigma = Sigma;
bar.w = sum([gmh.w]);
    

end

