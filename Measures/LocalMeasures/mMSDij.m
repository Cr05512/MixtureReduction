function dmMS = mMSDij(pdfi,pdfj,P)
% dmMS = mMSDij(pdf1,pdf2,P):
% INPUT:
% - pdf1, pdf2, two Gaussian densities,
% - P, global covariance matrix required to weight the pairwise distances.
% OUTPUT:
% - dmMS, modified Mahalanobis' Squared Distance.
% This function computes the modified mahalanobis' squared distance as
% suggested in:
% "Mixture reduction algorithms for target tracking in clutter", D.J. Salmond

dmMS = pdfi.w*pdfj.w/(pdfi.w+pdfj.w)*mahalSquaredDist(pdfi.mu,pdfj.mu,P);
end

