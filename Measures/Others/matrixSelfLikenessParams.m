function matrixslp = matrixSelfLikenessParams(w,mu,Sigma)
% matrixsl = matrixSelfLikeness(w,mu,Sigma):
% INPUTS:
% - w, mu, Sigma, Gaussian Mixture parameters.
% OUTPUTS:
% - matrixslp, the matrix self likeness (Nh x Nh matrix).
% This function computes the matrix self likenesses of a Gaussian mixture. Summing up over all the elements of such matrix
% returns the scalar self likeness of the mixture. 
% assert(~isempty(gm),'The Gaussian mixture has to contain at least one element.');

weightMatrix = w*w';
matrixslp = weightMatrix.*matrixUnwSelfLikeness(mu,Sigma);

end

