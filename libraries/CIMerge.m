function pdf_merged = CIMerge(gm)
% pdf_merged = CIMerge(gm):
% INPUTS:
% - gm, a Gaussian mixture.
% OUTPUTS:
% pdf_merged, the result of the covariance intersection merging.
% This function operates a weighted covariance intersection.

assert(length(gm)>=1,'The mixture has to contain at least one element.');

q = zeros(size(gm(1).mu));
Omega = zeros(size(gm(1).Sigma));
w_bar = sum([gm.w]);

for i=1:length(gm)
    Omegai = inv(gm(i).Sigma);
    qi = Omegai*gm(i).mu;
    Omega = Omega + (1/w_bar)*gm(i).w*Omegai;
    q = q + (1/w_bar)*gm(i).w*qi;
end

Sigma = inv(Omega);
mu = Sigma*q;

pdf_merged = struct('w',sum([gm.w]),'mu',mu,'Sigma',Sigma);

end

