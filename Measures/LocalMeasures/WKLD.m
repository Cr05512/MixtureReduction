function d = WKLD(wj,pdfi,pdfj,I)
% d = WKLD(wj,pdfi,pdfj,I):
% INPUT: 
% - wj, weight of the j-th component (scalar),
% - pdfi, pdfj, two Gaussian Densities,
% - I, number of virtual samples (scalar).
% OUTPUT:
% - d, weighted KLD (scalar).
% This function implements the modified KLD as used in:
% Q. Zhang and J. Chen. "A unified framework for gaussian mixture reduction
% with  composite  transportation  distance".arXiv:2002.08410v1  [stat.ML.],2020.
d = -log(wj) - I*funEij(pdfi,pdfj);
end

