function dmMS = mMSDij(pdf1,pdf2,P)
% dmMS = mMSDij(pdf1,pdf2,P):
% INPUT:
% - pdf1, pdf2, two Gaussian densities,
% - P, global covariance matrix required to weight the pairwise distances.
% OUTPUT:
% - dmMS, modified Mahalanobis' Squared Distance.
% This function computes the modified mahalanobis' squared distance as
% suggested in:
% "Mixture reduction algorithms for target tracking in clutter", D.J. Salmond

dmMS = pdf1.w*pdf2.w/(pdf1.w+pdf2.w)*mahalSquaredDist(pdf1.mu,pdf2.mu,P);
end

