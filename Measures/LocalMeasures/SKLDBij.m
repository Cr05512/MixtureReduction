function B = SKLDBij(pdfi, pdfj, maxiter, tol)
% B = KLDBij(pdf1,pdf2):
% INPUTS:
% - pdf1, pdf2, two Gaussian densities.
% OUTPUTS:
% - B, the Runnalls' upper bound on the divergence gain between the full and reduced mixture after the component 1
%   and 2 are merged (scalar).
% This function computes the upper bound proposed by A. R. Runnalls "Kullback-Leibler Approach to Gaussian Mixture
% Reduction". IEEE Trans. Aerosp. Electron. Syst., vol. 43(3):989--999, 2007

if nargin < 3
    maxiter = 200;
    tol = 1e-12;
elseif nargin < 4
    tol = 1e-12;
end


bar = SKLDBarycenter_mex([pdfi;pdfj], maxiter, tol);
    
B = pdfi.w*SKLDij(pdfi,bar) + pdfj.w*SKLDij(pdfj,bar);

end

