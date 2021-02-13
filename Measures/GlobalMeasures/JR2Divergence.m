function dJR2 = JR2Divergence(gmh,gmr)

dJR2 = GMRenyi2CrossEntropy(gmh,gmr) - 0.5*(GMRenyi2Entropy(gmh) + GMRenyi2Entropy(gmr));
end

