function Dabar = DaBarycenter(comps,alpha,maxiter,tol)

if nargin < 2
    alpha = 0.5;
    maxiter = 50;
    tol = 1e-6;
elseif nargin < 3
    maxiter = 50;
    tol = 1e-6;
elseif nargin < 4
    tol = 1e-6;
end

Dabar = RKLDBarycenter(comps);

n = length(comps);
d = size(comps(1).mu,1);

wVec = zeros(n,1);
muVec = zeros(d,n);
SigmaVec = zeros(d,d,n);
[wi,mui,Sigmai] = paramsFromMixture(comps);
normFactor = sum(wi);
Sigmaiinv = zeros(d,d,n);

for i=1:n
    Sigmaiinv(:,:,i) = eye(d)/Sigmai(:,:,i);
end

for k=1:maxiter
    Sigmainv = eye(d)/Dabar.Sigma;
    for i=1:n
        SigmaVec(:,:,i) = eye(d)/(alpha*Sigmaiinv(:,:,i) + (1-alpha)*Sigmainv);
        muVec(:,i) = SigmaVec(:,:,i)*(alpha*Sigmaiinv(:,:,i)*mui(:,i) + (1-alpha)*Sigmainv*Dabar.mu);
        gamma = alphaCij(comps(i),Dabar,alpha);
        wVec(i) = wi(i)*gamma;
    end
    
   wVec = wVec./sum(wVec);
    
    Dabarnew = KLDBarycenter(mixtureFromParams(wVec,muVec,SigmaVec));
    %if ~mod(k,5)
    if norm(Dabarnew.mu-Dabar.mu)<tol
        %Dabarnew.w = normFactor;
        Dabar = Dabarnew;
        break;
    else
        Dabar=Dabarnew;
    end
    %end
    
    
end
Dabar.w = normFactor;

end

