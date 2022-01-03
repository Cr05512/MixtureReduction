function bar =  CSDBarycenter(gmh,maxiter,tol)
if nargin < 2
    maxiter = 100;
    tol = 1e-10;
elseif nargin < 3
    tol = 1e-10;
end

d = size(gmh(1).mu,1);
N = numel(gmh);
bar = KLDBarycenter(gmh);
%bar = struct('w',sum([gmh.w]),'mu',sum([gmh.mu],2)/N,'Sigma',sum(cat(3,gmh.Sigma),3)/N);
mu = bar.mu;
Sigma = bar.Sigma;
mu_prev = mu;
Sigma_prev = Sigma;


[wh,muh,Sigmah] = paramsFromMixture(gmh);

wh = wh./sum(wh);

Sigmahinv = zeros(d,d,N);
wSigmahinv = Sigmahinv;

for k=1:maxiter
    muTmp = zeros(d,1);
    A = zeros(d,d);
    for i=1:N
        Sigmahinv(:,:,i) = inv(Sigma+Sigmah(:,:,i));
        wSigmahinv(:,:,i) = wh(i)*Sigmahinv(:,:,i);
        muTmp = muTmp + wSigmahinv(:,:,i)*muh(:,i);
    end
    mu = sum(wSigmahinv,3)\muTmp;
    
    for i=1:N
        diff = (mu-muh(:,i));
        A = A + wh(i)*(Sigmahinv(:,:,i) - Sigmahinv(:,:,i)*diff*diff'*Sigmahinv(:,:,i));
    end
    
    B = 2*A - diag(A);
    Sigma = eye(d)/(B + diag(B));
    
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

