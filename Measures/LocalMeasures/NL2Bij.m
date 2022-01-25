function B = NL2Bij(pdfi, pdfj, maxiter, tol)
% B = NL2Bij(pdf1,pdf2):
% INPUTS:
% - pdf1, pdf2, two Gaussian densities.
% OUTPUTS:
% - B, the Runnalls' upper bound on the divergence gain between the full and reduced mixture after the component 1
%   and 2 are merged (scalar).
% This function computes the upper bound proposed by A. R. Runnalls "Kullback-Leibler Approach to Gaussian Mixture
% Reduction". IEEE Trans. Aerosp. Electron. Syst., vol. 43(3):989--999, 2007

bar = NL2Barycenter([pdfi;pdfj], maxiter, tol);
    
B = pdfi.w*NL2ij(pdfi,bar) + pdfj.w*NL2ij(pdfj,bar);

end

