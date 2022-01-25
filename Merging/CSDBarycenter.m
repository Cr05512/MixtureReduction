function bar = CSDBarycenter(comps,maxiter,tol)

if nargin < 2
    maxiter = 150;
    tol = 1e-09;
elseif nargin < 3
    tol = 1e-09;
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


sumWi = sum(wi);


for k=1:maxiter
    barOld = bar;
    mu = bar.mu;
    Sigma = bar.Sigma;
    Sigmainv = eye(d)/Sigma;

    for i=1:n
        SigmaVec(:,:,i) = eye(d)/(Sigmaiinv(:,:,i) + Sigmainv); 
        muVec(:,i) = SigmaVec(:,:,i)*(Sigmaiinvmu(:,i) + Sigmainv*mu);
    end
    
    mu = 1/sumWi * muVec * wi;
    
    diffs = muVec-mu;
    
    P = zeros(d,d);
    
    for i=1:n
        P = P + wi(i)*(SigmaVec(:,:,i) + diffs(:,i)*diffs(:,i)');
    end
    
    %Sigma = P/(wc1bar + wc2bar);
    %Sigma = P/wc1bar -wc2bar/wc1bar * Sigma;
    Sigma = 2/sumWi * P;
    
    bar.mu = mu;
    bar.Sigma = Sigma;
    
    
    if mod(k,3)==1
        if CSDij(bar,barOld)<tol
            break;
        end
    end
end

if k==maxiter
    disp('The CSD FPI algorithm did not converge in the allowed iterations.');
end
end

