function gmr = COWAMRA(gmh,Nr,algo,gamma)
% gmr = COWAMRA(gmh,Nr,algo,gamma):
% INPUTS:
% - gmh, Gaussian Mixture,
% - Nr, desired number of components in the reduced mixture,
% - algo, Algorithm used for the initialization. This can take values 0,
%   (West Algorithm) and 1 (Enhanced West Algorithm)
% - gamma, dissimilarity threshold. If set to Inf all the "most similar"
%   components will be merged, indipendently of their distance.
% OUTPUTS:
% - gmr, the reduced mixture according to the COWA algorithm.
% This function performs the COWA algorithm in order to obtain a reduced
% Gaussian Mixture.
if nargin < 3
    algo = 1;
    gamma = Inf;
elseif nargin < 4
    gamma = Inf;
end
assert(~isempty(gmh),'The Gaussian Mixture has to be non-empty.');
assert(Nr>0,'The reduced mixture has to contain at least one element.');
assert(algo==0 || algo==1,'The algo parameter can be either 0 (West) or 1 (enhanced West).');
assert(Nr>0 && length(gmh)>=Nr,'The reduced mixture must have a positive number of components lower or equal to the starting mixture.');

Nh = length(gmh);
gmr = WestMRA(gmh,Nr,algo,gamma);
%gmr = SalmondMRA(gmh,Nr);
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
Hinv = inv(H);
b_star = Hinv*a - Hinv*c*(c'*Hinv*a-1)*inv(c'*Hinv*c);
w_star = num2cell(b_star);
[gmr.w] = w_star{:};
end

