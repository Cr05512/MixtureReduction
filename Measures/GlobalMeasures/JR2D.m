function dJR2 = JR2D(gmh,gmr)

%dJR2 = GMRenyi2CrossEntropy(gmh,gmr) - 0.5*(GMRenyi2Entropy(gmh) + GMRenyi2Entropy(gmr));

Jhh = selfLikeness(gmh);
Jhr = crossLikeness(gmh,gmr);
Jrr = selfLikeness(gmr);


%dJR2 = 0.5*log(Jhh*Jrr) - log((1/4)*(Jhh + 2*Jhr + Jrr));
dJR2 = -log((Jhh + 2*Jhr + Jrr)/(4*sqrt(Jhh*Jrr)));


% Nh = numel(gmh);
% Nr = numel(gmr);
% M = Nh + Nr;
% 
% pi1 = Nh/M;
% pi2 = Nr/M;
% 
% dJR2 = -log(pi1^2*Jhh + 2*pi1*pi2*Jhr + pi2^2*Jrr) + (pi1*log(Jhh) + pi2*log(Jrr));
end

