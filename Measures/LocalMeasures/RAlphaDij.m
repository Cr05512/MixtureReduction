function R_alpha = RAlphaDij(pdfi,pdfj,alpha)
% Renyi Alpha Divergence
if nargin < 3
    alpha = 0.5; 
end
assert(alpha>0 && alpha <1,'Alpha has to take values greater than 0 and smaller than 1.');

mui = pdfi.mu;
muj = pdfj.mu;
Sigmai = pdfi.Sigma;
Sigmaj = pdfj.Sigma;
alphaSigmaij = alpha*Sigmaj + (1-alpha)*Sigmai;

R_alpha = 0.5*(mui-muj)'*(alphaSigmaij\(mui-muj)) - 0.5/(2*alpha*(alpha-1))*log(det(alphaSigmaij)/(det(Sigmai)^(1-alpha) * det(Sigmaj)^alpha));

end

