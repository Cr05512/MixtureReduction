function bar = ISEFPIBarycenter(comps,maxiter,tol)

if nargin < 2
    maxiter = 50;
    tol = 1e-6;
elseif nargin < 3
    tol = 1e-6;
end

bar = KLDBarycenter(comps);

n = length(comps);
d = size(comps(1).mu,1);

wVec = zeros(n,1);
muVec = zeros(d,n);
SigmaVec = zeros(d,d,n);
[wi,mui,Sigmai] = paramsFromMixture(comps);
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
        wVec(i) = wi(i)*mvnpdf(mui(:,i),mu,Sigmai(:,:,i) + Sigma);
    end
    

    gmTilde = mixtureFromParams(wVec,muVec,SigmaVec);
    [mu,P] = getMixtureMoments(gmTilde);
    bar.mu = mu;
    
end

end

