function H = matrixUnwSelfLikeness(gmh)
% H = matrixUnwSelfLikeness(gmh):
% INPUTS:
% - gmh, a Gaussian mixtures.
% OUTPUTS:
% - H, the matrix unweighted self likenesses (Nh x Nh matrix).
% This function computes the matrix self likenesses of a Gaussian mixture. Summing up over all the elements of such matrix
% returns the scalar self likeness of the mixture. 
assert(~isempty(gmh),'The mixture have to contain at least one element.');

N = numel(gmh);

H = zeros(N,N);

for i=1:N
    for j=1:N
         H(i,j) = mvnpdf(gmh(i).mu,gmh(j).mu,gmh(i).Sigma + gmh(j).Sigma);
    end
end

end

