function bar = NL2Barycenter(comps,maxiter,tol)

if nargin < 2
    maxiter = 500;
    tol = 1e-09;
elseif nargin < 3
    tol = 1e-09;
end

n = length(comps);
d = size(comps(1).mu,1);

bar = RKLDBarycenter(comps);

muVec = zeros(d,n);
SigmaVec = zeros(d,d,n);
[wi,mui,Sigmai] = paramsFromMixture(comps);

Sigmaiinv = zeros(d,d,n);
Sigmaiinvmu = zeros(d,n);
for i=1:n
    Sigmaiinv(:,:,i) = eye(d)/Sigmai(:,:,i);
    Sigmaiinvmu(:,i) = Sigmaiinv(:,:,i)*mui(:,i);
end

Jii = diag(matrixUnwSelfLikeness(mui,Sigmai));

for k=1:maxiter
    barOld = bar;
    mu = bar.mu;
    Sigma = bar.Sigma;
    Sigmainv = eye(d)/Sigma;
    Jrr = 1/sqrt((4*pi)^d * det(Sigma));
    Jir = matrixUnwCrossLikeness(mui,Sigmai,mu,Sigma);
    den = Jii + Jrr;
    c1 = -2./den;
    c2 = 2.*Jir./(den.^2);
    wc1 = wi.*Jir.*c1;
    wc2 = wi.*Jrr.*c2;
    for i=1:n
        SigmaVec(:,:,i) = eye(d)/(Sigmaiinv(:,:,i) + Sigmainv); 
        muVec(:,i) = SigmaVec(:,:,i)*(Sigmaiinvmu(:,i) + Sigmainv*mu);
    end
    
    wc1bar = sum(wc1);
    wc2bar = sum(wc2);
    
    mu = 1/wc1bar * muVec * wc1;
    
    diffs = muVec-mu;
    
    P = zeros(d,d);
    
    for i=1:n
        P = P + wc1(i)*(SigmaVec(:,:,i) + diffs(:,i)*diffs(:,i)');
    end
    
    %Sigma = P/(wc1bar + wc2bar);
    Sigma = P/wc1bar -wc2bar/wc1bar * Sigma;
    
    
    bar.mu = mu;
    bar.Sigma = Sigma;
    
    
    if mod(k,10)==1
        if NL2ij(bar,barOld)<tol
            break;
        end
    end
    
end
if k==maxiter
    disp('The NL2 FPI algorithm did not converge in the allowed iterations.');
end

end

