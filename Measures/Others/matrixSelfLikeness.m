function matrixsl = matrixSelfLikeness(gmh)
% matrixsl = matrixSelfLikeness(gmh):
% INPUTS:
% - gmh, a Gaussian mixtures.
% OUTPUTS:
% - matrixsl, the matrix self likeness (Nh x Nh matrix).
% This function computes the matrix self likenesses of a Gaussian mixture. Summing up over all the elements of such matrix
% returns the scalar self likeness of the mixture. 
assert(~isempty(gmh),'The mixture have to contain at least one element.');

N = numel(gmh);

matrixsl = Inf(N,N);

for i=1:N
    for j=1:N
         matrixsl(i,j) = gmh(i).w*gmh(j).w*mvnpdf(gmh(i).mu,gmh(j).mu,gmh(i).Sigma + gmh(j).Sigma);
    end
end

end

