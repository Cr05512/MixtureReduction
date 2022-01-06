function Dabar = Da2Barycenter(comps,alpha,maxiter,tol)

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
     Dabar = KLDBarycenter(comps);
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
w = sum(wi);
Sigmaiinv = zeros(d,d,n);

for i=1:n
    Sigmaiinv(:,:,i) = eye(d)/Sigmai(:,:,i);
end

for k=1:maxiter
    Sigmainv = eye(d)/Dabar.Sigma;
    for i=1:n
        SigmaVec(:,:,i) = eye(d)/(alpha*Sigmaiinv(:,:,i) + (1-alpha)*Sigmainv);
        muVec(:,i) = SigmaVec(:,:,i)*(alpha*Sigmaiinv(:,:,i)*mui(:,i) + (1-alpha)*Sigmainv*Dabar.mu);
        wVec(i) = wi(i);
    end
    
    wVec = wVec./sum(wVec);
    wNew = sum(wVec);
    
    mu = sum(wVec'.*muVec,2)/wNew;
    
    Sigma = zeros(d,d);
    for i=1:n
        diff = muVec(:,i) - mu;
        Sigma = Sigma + wVec(i)*(SigmaVec(:,:,i) + diff*diff');
    end
    Sigma = Sigma/wNew;
    Dabarnew = mixtureFromParams(w,mu,Sigma);
    
    if alpha1Dij(Dabarnew,Dabar,alpha)<tol
        Dabar = Dabarnew; 
        break;
    end
    
    Dabar=Dabarnew;
    
end

end

