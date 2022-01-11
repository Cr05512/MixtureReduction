function bar = H2Barycenter(comps,maxiter,tol)

if nargin < 2
    maxiter = 100;
    tol = 1e-9;
elseif nargin < 3
    tol = 1e-9;
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
        SigmaVec(:,:,i) = 2*eye(d)/((Sigmaiinv(:,:,i) + Sigmainv));
        muVec(:,i) = 0.5*SigmaVec(:,:,i)*(Sigmaiinv(:,:,i)*mui(:,i) + Sigmainv*bar.mu);
        gamma = BCij(comps(i),bar);
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
        if H2ij(barnew,bar)<tol
            bar = barnew; 
            break;
        end
    end
    
    bar=barnew;
end

end

