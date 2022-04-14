function bar = H2Barycenter(comps,maxiter,tol)

if nargin < 2
    maxiter = 500;
    tol = 1e-12;
elseif nargin < 3
    tol = 1e-12;
end

% if alpha==0
%     bar = RKLDBarycenter(comps);
% elseif alpha==1
     bar = FKLDBarycenter(comps);
% else
%      [~,idx] = max([comps.w]);
%      bar = comps(idx);
%      bar.w = sum([comps.w]);
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

numIter = 0;
for k=1:maxiter
    barOld = bar;
    Sigmainv = eye(d)/bar.Sigma;
    for i=1:n
        SigmaVec(:,:,i) = 2*eye(d)/((Sigmaiinv(:,:,i) + Sigmainv));
        muVec(:,i) = 0.5*SigmaVec(:,:,i)*(Sigmaiinv(:,:,i)*mui(:,i) + Sigmainv*bar.mu);
        gamma = BCij(comps(i),bar);
        wVec(i) = wi(i)*gamma;
    end
    
    wVec = wVec./sum(wVec);
    
    mu = zeros(d,1);
    for i=1:n
        mu = mu + wVec(i)*muVec(:,i);
    end
    %mu = sum(wVec'.*muVec,2);
    
    Sigma = zeros(d,d);
    for i=1:n
        diff = muVec(:,i) - mu;
        Sigma = Sigma + wVec(i)*(SigmaVec(:,:,i) + diff*diff');
    end
    bar.mu = mu;
    bar.Sigma = Sigma;
    
    if mod(k,5)==0
        if H2ij(bar,barOld)<tol
            break;
        end
    end
    numIter=k;
end
if numIter==maxiter
    disp('The H2 FPI algorithm did not converge in the allowed iterations.');
end

end

