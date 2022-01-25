function Dabar = Da2Barycenter(comps,alpha,maxiter,tol)

if nargin < 2
    alpha = 0.5;
    maxiter = 500;
    tol = 1e-09;
elseif nargin < 3
    maxiter = 500;
    tol = 1e-09;
elseif nargin < 4
    tol = 1e-09;
end

% if alpha==0
    bar = FKLDBarycenter(comps);
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
    barOld = bar
    Sigmainv = eye(d)/bar.Sigma;
    for i=1:n
        SigmaVec(:,:,i) = eye(d)/(alpha*Sigmaiinv(:,:,i) + (1-alpha)*Sigmainv);
        muVec(:,i) = SigmaVec(:,:,i)*(alpha*Sigmaiinv(:,:,i)*mui(:,i) + (1-alpha)*Sigmainv*bar.mu);
    end
    
    
    mu = sum(wi'.*muVec,2)/wiSum;
    
    Sigma = zeros(d,d);
    for i=1:n
        diff = muVec(:,i) - mu;
        Sigma = Sigma + wi(i)*(SigmaVec(:,:,i) + diff*diff');
    end
    
    Sigma = Sigma/wiSum;

    bar.mu = mu;
    bar.Sigma = Sigma;
    
   if mod(k,10)==1
        if alpha2Dij(bar,barOld,alpha)<tol
            break;
        end
   end
end

if k==maxiter
    disp('The Da2 FPI algorithm did not converge in the allowed iterations.');
end

end

