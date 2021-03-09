function dJR2 = JR2D(gmh,gmr)

% dJR2 = GMRenyi2CrossEntropy(gmh,gmr) - 0.5*(GMRenyi2Entropy(gmh) + GMRenyi2Entropy(gmr));

Jhh = selfLikeness(gmh);
Jhr = crossLikeness(gmh,gmr);
Jrr = selfLikeness(gmr);

dJR2 = 0.5*log(Jhh*Jrr) - log((1/4)*(Jhh + 2*Jhr + Jrr));
end

