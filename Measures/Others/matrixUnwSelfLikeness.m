function Hhh = matrixUnwSelfLikeness(mu,Sigma)
% Hhh = matrixUnwSelfLikeness(mu,Sigma):
% INPUTS:
% - mu, Sigma, Gaussian mixture means and covariances.
% OUTPUTS:
% - matrixsl, the matrix unweighted self likeness (Nh x Nh matrix).
% This function computes the matrix self likenesses of a Gaussian mixture. Summing up over all the elements of such matrix
% returns the scalar self likeness of the mixture. 
assert(size(mu,2)>0 && size(mu,2)==size(Sigma,3) && size(mu,1)==size(Sigma,1),'The mixture parameters are inconsistent.');

N = size(mu,2);

Hhh = Inf(N,N);

for i=1:N
    for j=1:N
         Hhh(i,j) = mvnpdf(mu(:,i),mu(:,j),Sigma(:,:,i) + Sigma(:,:,j));
    end
end

end