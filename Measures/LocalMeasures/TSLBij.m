function B = TSLBij(pdfi, pdfj, maxiter, tol)
% B = TSLBij(pdf1,pdf2):
% INPUTS:
% - pdf1, pdf2, two Gaussian densities.
% OUTPUTS:
% - B, the Runnalls' upper bound on the divergence gain between the full and reduced mixture after the component 1
%   and 2 are merged (scalar).
% This function computes the upper bound proposed by A. R. Runnalls "Kullback-Leibler Approach to Gaussian Mixture
% Reduction". IEEE Trans. Aerosp. Electron. Syst., vol. 43(3):989--999, 2007

if nargin < 3
    maxiter = 500;
    tol = 1e-9;
elseif nargin < 4
    tol = 1e-9;
end

bar = TSLBarycenter([pdfi;pdfj], maxiter, tol);
    
B = pdfi.w*TSLij(pdfi,bar) + pdfj.w*TSLij(pdfj,bar);

end

