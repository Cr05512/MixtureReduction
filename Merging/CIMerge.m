function pdf_merged = CIMerge(gm)
% [w_merged,pdf_merged] = CIMerge(w,comps):
% INPUTS:
% - gm, a Gaussian mixture.
% OUTPUTS:
% - pdf_merged, the resulting component after CI merging (Gaussian density).
% This function operates a weighted covariance intersection.

assert(~isempty(gm),'The mixture has to contain at least one element.');

d = size(gm(1).mu,1);
q = zeros(d,1);
Omega = zeros(d,d);
w_bar = sum([gm.w]);

for i=1:numel(gm)
    Omegai = inv(gm(i).Sigma);
    qi = Omegai*gm(i).mu;
    Omega = Omega + (1/w_bar)*gm(i).w*Omegai;
    q = q + (1/w_bar)*gm(i).w*qi;
end

Sigma = inv(Omega);
mu = Sigma*q;

pdf_merged = struct('w',w_bar,'mu',mu,'Sigma',Sigma);

end

