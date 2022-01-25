function daGJSD = alphaGJSDij(pdfi,pdfj,alpha)
if nargin < 3
    alpha = 0.5;
end

mui = pdfi.mu;
muj = pdfj.mu;
d = size(mui,1);
Sigmai = pdfi.Sigma;
Sigmaiinv = eye(d)/Sigmai;
Sigmaj = pdfj.Sigma;
Sigmajinv = eye(d)/Sigmaj;

aSigma = eye(d)/((1-alpha)*Sigmaiinv + alpha*Sigmajinv);
aMu = aSigma*((1-alpha)*Sigmaiinv*mui + alpha*Sigmajinv)*muj;
aSigmainv = eye(d)/aSigma;
diffi = aMu-mui;
diffj = aMu-muj;

daGJSD = 0.5*(trace(aSigma*((1-alpha)*Sigmai+alpha*Sigmaj)) + log(det(aSigma))+...
            - (1-alpha)*log(det(Sigmai)) - alpha*log(det(Sigmaj)) +...
            + (1-alpha)*diffi'*aSigma*diffi + alpha*diffj'*aSigma*diffj - d);

end

