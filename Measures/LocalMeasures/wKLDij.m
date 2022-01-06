function dKitagawa = wKLDij(pdfi,pdfj)

wi = pdfi.w;
wj = pdfj.w;
mui = pdfi.mu;
muj = pdfj.mu;
diff = mui-muj;
Sigmai = pdfi.Sigma;
Sigmaj = pdfj.Sigma;
d = size(mui,1);
Sigmaiinv = eye(d)/Sigmai;
Sigmajinv = eye(d)/Sigmaj;

dKitagawa = wi*wj*(trace(Sigmajinv*Sigmai) + trace(Sigmaiinv*Sigmaj) + diff'*(Sigmaiinv+Sigmajinv)*diff);

end

