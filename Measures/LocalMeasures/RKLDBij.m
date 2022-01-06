function B = RKLDBij(pdfi, pdfj)
% B = RKLDBij(pdf1,pdf2):
% INPUTS:
% - pdf1, pdf2, two Gaussian densities.
% OUTPUTS:
% - B, to be documented

bar = RKLDBarycenter([pdfi;pdfj]);
    
B = pdfi.w*RKLDij(pdfi,bar) + pdfj.w*RKLDij(pdfj,bar);

end

