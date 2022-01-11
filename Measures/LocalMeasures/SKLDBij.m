function B = SKLDBij(pdfi, pdfj)
% B = KLDBij(pdf1,pdf2):
% INPUTS:
% - pdf1, pdf2, two Gaussian densities.
% OUTPUTS:
% - B, the Runnalls' upper bound on the divergence gain between the full and reduced mixture after the component 1
%   and 2 are merged (scalar).
% This function computes the upper bound proposed by A. R. Runnalls "Kullback-Leibler Approach to Gaussian Mixture
% Reduction". IEEE Trans. Aerosp. Electron. Syst., vol. 43(3):989--999, 2007

bar = SKLDBarycenter([pdfi;pdfj]);
    
B = pdfi.w*SKLDij(pdfi,bar) + pdfj.w*SKLDij(pdfj,bar);

end

