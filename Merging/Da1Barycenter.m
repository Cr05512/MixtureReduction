function bar = Da1Barycenter(comps,alpha,maxiter,tol)

if nargin < 2
    alpha = 0.5;
    maxiter = 100;
    tol = 1e-12;
elseif nargin < 3
    maxiter = 100;
    tol = 1e-12;
elseif nargin < 4
    tol = 1e-12;
end

% if alpha==0
%     Dabar = RKLDBarycenter(comps);
% elseif alpha==1
     bar = KLDBarycenter(comps);
% else
%     [~,idx] = max([comps.w]);
%     Dabar = comps(idx);
% end

barnew = bar;

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
    Sigmainv = eye(d)/bar.Sigma;
    for i=1:n
        SigmaVec(:,:,i) = eye(d)/(alpha*Sigmaiinv(:,:,i) + (1-alpha)*Sigmainv);
        muVec(:,i) = SigmaVec(:,:,i)*(alpha*Sigmaiinv(:,:,i)*mui(:,i) + (1-alpha)*Sigmainv*bar.mu);
        gamma = alphaCij(comps(i),bar,alpha);
        wVec(i) = wi(i)*gamma;
    end
    
    wVec = wVec./sum(wVec);
    
    mu = sum(wVec'.*muVec,2);
    
    Sigma = zeros(d,d);
    for i=1:n
        diff = muVec(:,i) - mu;
        Sigma = Sigma + wVec(i)*(SigmaVec(:,:,i) + diff*diff');
    end
    barnew.mu = mu;
    barnew.Sigma = Sigma;
    
    if mod(k,5)==1
        if alpha1Dij(barnew,bar,alpha)<tol
            bar = barnew; 
            break;
        end
    end
    
    bar=barnew;
end

end

