function gmr = COWAOpt(gmh,gmr)
% gmr = COWAopt(gmh,gmr):
% INPUTS:
% - gmh, gmr, two Gaussian mixtures
% OUTPUTS:
% - gmr, the weight optimized reduced mixture
% This function implements the weight optimization as shown in
% Constrained optimized weight adaption for Gaussian mixture reduction, H.Chen, K. C. Chang, C. Smith
assert(~isempty(gmh) && ~isempty(gmr),'The Gaussian Mixture has to be non-empty.');

Nh = length(gmh);
Nr = length(gmr);
a = zeros(Nr,1);
for i=1:Nr
    for j=1:Nh
        a(i) = a(i) + gmh(j).w*mvnpdf(gmr(i).mu,gmh(j).mu,gmr(i).Sigma + gmh(j).Sigma);
    end
end
c = ones(Nr,1);
H = Inf(Nr,Nr);
for i=1:Nr
    for j=1:Nr
        H(i,j) = mvnpdf(gmr(i).mu,gmr(j).mu,gmr(i).Sigma + gmr(j).Sigma);
    end
end
b_star = H\a - H\c*(c'*(H\a)-1)*inv(c'*(H\c));
w_star = num2cell(b_star);
[gmr.w] = w_star{:};
end

