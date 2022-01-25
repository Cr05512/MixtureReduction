function daJ = alphaJDij(pdfi,pdfj,alpha)
if nargin < 3
    alpha = 0.5;
end
mui = pdfi.mu;
muj = pdfj.mu;
d = size(mui,1);
Sigmai = pdfi.Sigma;
Sigmaj = pdfj.Sigma;
Sigmaiinv = eye(d)/Sigmai;
Sigmajinv = eye(d)/Sigmaj;
diff = mui-muj;
daJ = 0.5*(trace((1-alpha)*Sigmajinv*Sigmai+alpha*Sigmaiinv*Sigmaj)+...
             +diff'*(alpha*Sigmaiinv+(1-alpha)*Sigmajinv)*(mui-muj)-d+(1-2*alpha)*log(det(Sigmaj)/det(Sigmai)));
end

