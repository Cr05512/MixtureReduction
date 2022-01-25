function bar = TSLBarycenter(comps,maxiter,tol)

if nargin < 2
    maxiter = 150;
    tol = 1e-12;
elseif nargin < 3
    tol = 1e-12;
end

n = length(comps);
d = size(comps(1).mu,1);

bar = FKLDBarycenter(comps);

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
    den = 1+4*Jrr*sqrt(1+4*Jrr);
    c1 = -2*(1+4*Jrr)/den;
    c2 = (1 - 2*(Jii - 2*Jir - Jrr))/den;
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
    
    
    if mod(k,5)==1
        if TSLij(bar,barOld)<tol
            break;
        end
    end
    
end

if k==maxiter
    disp('The TSL FPI algorithm did not converge in the allowed iterations.');
end

end

