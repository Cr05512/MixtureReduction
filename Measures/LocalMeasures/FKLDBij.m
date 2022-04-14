function B = FKLDBij(pdfi, pdfj)
% B = KLDBij(pdf1,pdf2):
% INPUTS:
% - pdf1, pdf2, two Gaussian densities.
% OUTPUTS:
% - B, the Runnalls' upper bound on the divergence gain between the full and reduced mixture after the component 1
%   and 2 are merged (scalar).
% This function computes the upper bound proposed by A. R. Runnalls "Kullback-Leibler Approach to Gaussian Mixture
% Reduction". IEEE Trans. Aerosp. Electron. Syst., vol. 43(3):989--999, 2007

bar = FKLDBarycenter([pdfi;pdfj]);
B = pdfi.w*FKLDij(pdfi,bar)+pdfj.w*FKLDij(pdfj,bar);
%B = 0.5*((pdfi.w+pdfj.w)*log(det(bar.Sigma))-pdfi.w*log(det(pdfi.Sigma))-pdfj.w*log(det(pdfj.Sigma)));

end

