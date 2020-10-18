function DRE = DREntropy(pdf1, pdf2)
%Differential Relative Entropy between two Gaussian measures
%(Kullback-Leibler Divergence)
DRE = 0.5*(BurgMatrixDivergence(pdf1.Sigma,pdf2.Sigma) + mahalSquaredDist(pdf1.mu,pdf2.mu,pdf2.Sigma));
end

