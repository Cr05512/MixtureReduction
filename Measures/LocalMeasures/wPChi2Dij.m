function dPchi2D = wPChi2Dij(pdfi,pdfj)

bar = KLDBarycenter([pdfi,pdfj]);
wi = pdfi.w;
wj = pdfj.w;
mui = pdfi.mu;
muj = pdfj.mu;

d = size(mui,1);

Sigmai = pdfi.Sigma;
Sigmaiinv = eye(d)/Sigmai;
Sigmaj = pdfj.Sigma;
Sigmajinv = eye(d)/Sigmaj;
xiij = bar.mu;
Vij = bar.Sigma;
Vijinv = eye(d)/Vij;
Sigmaijinv = (Sigmaiinv + Sigmajinv);
Sigmaij = eye(d)/Sigmaijinv;
Wij = Sigmaijinv - Vijinv;

zetaij = Sigmaij*(Sigmaiinv*mui + Sigmajinv*muj);


Wbari = 2*Sigmaiinv-Vijinv;
Wbarj = 2*Sigmajinv-Vijinv;
etai = Wbari\(2*Sigmaiinv*mui-Vijinv*xiij);
etaj = Wbarj\(2*Sigmajinv*muj-Vijinv*xiij);
etaij = Wij\(Sigmaijinv*zetaij-Vijinv*xiij);

gamma1 = sqrt(det(Vij))/(det(Sigmai)*sqrt(det(Wbari)))*exp(-0.5*(mui-etai)'*(Wbari\(mui-etai)));
gamma2 = sqrt(det(Vij))/(det(Sigmaj)*sqrt(det(Wbarj)))*exp(-0.5*(muj-etaj)'*(Wbarj\(muj-etaj)));

gamma3 = sqrt(det(Vij))/(sqrt(det(Sigmai)*det(Sigmaj)*det(Wij)))*...
         exp(-0.5*(mui-muj)'*((Sigmai+Sigmaj)\(mui-muj)))*...
         exp(-0.5*(zetaij-etaij)'*((Vij-Sigmaij)\(zetaij-etaij)));

dPchi2D = wi^2*gamma1 + wj^2*gamma2 + 2*wi*wj*gamma3;

end

