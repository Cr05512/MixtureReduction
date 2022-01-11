function Dabar = Da2Barycenter(comps,alpha,maxiter,tol)

if nargin < 2
    alpha = 0.5;
    maxiter = 150;
    tol = 1e-12;
elseif nargin < 3
    maxiter = 150;
    tol = 1e-12;
elseif nargin < 4
    tol = 1e-12;
end

% if alpha==0
    Dabar = KLDBarycenter(comps);
% elseif alpha==1
%     Dabar = KLDBarycenter(comps);
% else
%     [~,idx] = max([comps.w]);
%     Dabar = comps(idx);
% end

n = length(comps);
d = size(comps(1).mu,1);

muVec = zeros(d,n);
SigmaVec = zeros(d,d,n);
[wi,mui,Sigmai] = paramsFromMixture(comps);
wiSum = sum(wi);
Sigmaiinv = zeros(d,d,n);

for i=1:n
    Sigmaiinv(:,:,i) = eye(d)/Sigmai(:,:,i);
end

for k=1:maxiter
    Sigmainv = eye(d)/Dabar.Sigma;
    for i=1:n
        SigmaVec(:,:,i) = eye(d)/(alpha*Sigmaiinv(:,:,i) + (1-alpha)*Sigmainv);
        muVec(:,i) = SigmaVec(:,:,i)*(alpha*Sigmaiinv(:,:,i)*mui(:,i) + (1-alpha)*Sigmainv*Dabar.mu);
    end
    
    
    mu = sum(wi'.*muVec,2)/wiSum;
    
    Sigma = zeros(d,d);
    for i=1:n
        diff = muVec(:,i) - mu;
        Sigma = Sigma + wi(i)*(SigmaVec(:,:,i) + diff*diff');
    end
    
    Sigma = Sigma/wiSum;

    Dabarnew = mixtureFromParams(wiSum,mu,Sigma);
    
   if mod(k,5)==1
        if alpha2Dij(Dabarnew,Dabar)<tol
            Dabar=Dabarnew;
            break;
        end
    end
    
    Dabar=Dabarnew;
end

end

