function B = KLDBij(pdf1, pdf2)
% B = KLDBij(pdf1,pdf2):
% INPUTS:
% - pdf1, pdf2, two Gaussian densities.
% OUTPUTS:
% - B, the Runnalls' upper bound on the divergence gain between the full and reduced mixture after the component 1
%   and 2 are merged (scalar).
% This function computes the upper bound proposed by A. R. Runnalls "Kullback-Leibler Approach to Gaussian Mixture
% Reduction". IEEE Trans. Aerosp. Electron. Syst., vol. 43(3):989--999, 2007

pdf_merge = KLDBarycenter([pdf1;pdf2]);
    
B = 0.5*(pdf_merge.w*log(det(pdf_merge.Sigma))...
    - pdf1.w*log(det(pdf1.Sigma))...
    - pdf2.w*log(det(pdf2.Sigma)));

end

