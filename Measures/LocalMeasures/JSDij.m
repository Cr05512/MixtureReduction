function dJS = JSDij(pdfh,pdfr)
% JSD = JSDij(pdfh,pdfr):
% INPUTS:
% - pdfh, pdfr, two Gaussian densities.
% OUTPUTS:
% - dJS, resulting Jensen-Shannon divergence (scalar).
% This function computes the Jensen-Shannon divergence between two multivariate Gaussians. It is
% not suitable for other kind of distributions.


% M = struct('w',1,'mu',(pdfh.mu+pdfr.mu)/2,'Sigma',(pdfh.Sigma+pdfr.Sigma)/2);
% 
% dJS = 0.5*(KLD(pdfh,M) + KLD(pdfr,M));

dJS = GJSD(pdfh,pdfr,0.5);

%The two expressions above are equivalent

end

