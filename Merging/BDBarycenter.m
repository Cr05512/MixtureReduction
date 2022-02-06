function bar =  BDBarycenter(comps,maxiter,tol)
if nargin < 2
    maxiter = 500;
    tol = 1e-09;
elseif nargin < 3
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

numIter = 0;

for k=1:maxiter
    barOld = bar;
    Sigmainv = eye(d)/bar.Sigma;
    for i=1:n
        SigmaVec(:,:,i) = 2*eye(d)/(Sigmaiinv(:,:,i) + Sigmainv);
        muVec(:,i) = 0.5*SigmaVec(:,:,i)*(Sigmaiinv(:,:,i)*mui(:,i) + Sigmainv*bar.mu);
    end
    
    mu = zeros(d,1);
    for i=1:n
        mu = mu + wi(i)*muVec(:,i);
    end
    mu = mu/wiSum;
    
    Sigma = zeros(d,d);
    for i=1:n
        diff = muVec(:,i) - mu;
        Sigma = Sigma + wi(i)*(SigmaVec(:,:,i) + diff*diff');
    end
    
    Sigma = Sigma/wiSum;

    bar.mu = mu;
    bar.Sigma = Sigma;
    
   if mod(k,5)==0
        if BDij(bar,barOld)<tol
            break;
        end
   end
   numIter = numIter + 1;
end
if numIter==maxiter
    disp('The BD FPI algorithm did not converge in the allowed iterations.');
end
    

end

