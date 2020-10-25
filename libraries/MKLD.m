function d = MKLD(pdfi,pdfj,lambda,I)
% MKL = MKLD(pdfi,pdfj,lambda,I):
% INPUTS:
% - pdfi, pdfj, two Gaussian densities,
% - lambda, regularization parameter,
% - I, number of virtual samples.
% OUTPUTS:
% - d, the modified KLD.
% This function computes the modified KLD between two Gaussian densities.
if nargin < 3
    lambda = 1;
    I = 50;
elseif nargin < 4
    I = 50;
end
assert(lambda>=0,'The lambda parameter has to be non-negative.');
assert(I>0,'The number of virtual samples has to be greater than 0.');

d = -(1/lambda)*log(pdfj.w) + (I/lambda)*KLD(pdfi,pdfj);
end

