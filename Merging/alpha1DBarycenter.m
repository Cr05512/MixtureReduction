function bar = alpha1DBarycenter(comps,alpha,maxiter,tol)

if nargin < 2
    alpha = 0.5;
    maxiter = 500;
    tol = 1e-12;
elseif nargin < 3
    maxiter = 500;
    tol = 1e-12;
elseif nargin < 4
    tol = 1e-12;
end

% if alpha==0
%     Dabar = RKLDBarycenter(comps);
% elseif alpha==1
     bar = FKLDBarycenter(comps);
% else
%     [~,idx] = max([comps.w]);
%     Dabar = comps(idx);
% end

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
    barOld = bar;
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
    bar.mu = mu;
    bar.Sigma = Sigma;
    
    if mod(k,5)==0
        if alpha1Dij(bar,barOld,alpha)<tol
            break;
        end
    end
end

if k==maxiter
    disp('The Da1 FPI algorithm did not converge in the allowed iterations.');
end

end

