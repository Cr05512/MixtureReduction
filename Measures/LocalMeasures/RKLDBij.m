function B = RKLDBij(pdf1, pdf2)
% B = RKLDBij(pdf1,pdf2):
% INPUTS:
% - pdf1, pdf2, two Gaussian densities.
% OUTPUTS:
% - B, to be documented

bar = RKLDBarycenter([pdf1;pdf2]);
    
B = pdf1.w*RKLDij(pdf1,bar) + pdf2.w*RKLDij(pdf2,bar);

end

