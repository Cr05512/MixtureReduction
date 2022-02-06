function d = MKLDij(pdfi,pdfj,I)
% d = MKLDij(wj,pdfi,pdfj,I):
% INPUT: 
% - pdfi, pdfj, two Gaussian Densities,
% - I, number of virtual samples (scalar).
% OUTPUT:
% - d, weighted KLD (scalar).
% This function implements the modified KLD as used in:
% Q. Zhang and J. Chen. "A unified framework for gaussian mixture reduction
% with  composite  transportation  distance".arXiv:2002.08410v1  [stat.ML.],2020.
if nargin < 3
    I = 1;
end
d = -log(pdfj.w) - I*funEij(pdfi,pdfj);

end

