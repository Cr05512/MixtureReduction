function bar = CSDFPBarycenter(comps,maxiter,tol)

if nargin < 2
    maxiter = 100;
    tol = 1e-6;
elseif nargin < 3
    tol = 1e-6;
end


bar = KLDBarycenter(comps);
barnew = bar;

n = length(comps);
d = size(comps(1).mu,1);

wSigmaVec = zeros(d,d,n);
wmuVec = zeros(d,n);

[wi,mui,Sigmai] = paramsFromMixture(comps);
normFactor = sum(wi);

for k=1:maxiter
    
    for i=1:n
        wSigmaVec(:,:,i) = wi(i)*eye(d)/(Sigmai(:,:,i) + bar.Sigma);
        wmuVec(:,i) = wSigmaVec(:,:,i)*mui(:,i);
    end
    
    mu = sum(wSigmaVec,3)\sum(wmuVec,2);
    
    Sigma = zeros(d,d);
    
    for i=1:n
        diff = mui(:,i)-mu;
        Sigma = Sigma + 0.5*wi(i)*eye(d)/(sum(wSigmaVec,3)*(eye(d)-diff*diff'*wSigmaVec(:,:,i)/wi(i)));
    end

    barnew.mu = mu;
    barnew.Sigma = Sigma;

    if CSDij(barnew,bar)<tol
        bar = barnew;
        break;
    end

    bar=barnew;
    
    
end

end

