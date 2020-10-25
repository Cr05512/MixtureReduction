function samples = SigmaPointsGM(gm)
% samples = SigmaPointsGM(gm):
% INPUTS:
% - gm, a Gaussian mixture.
% OUTPUTS:
% - samples, sigma points generated from each component of the mixture.
% This function generate the sigma points from each component of the
% mixture.

assert(~isempty(gm),'The mixture has to contain at least one element.');

n = size(gm(1).mu,1);
N = length(gm);
samples = [];

lambda = 3-n;
samples = [samples [gm.mu]];
A = reshape([gm.Sigma],n,n,N);


for i=1:N
    A(:,:,i) = sqrt(lambda+n)*chol(A(:,:,i));
    for j=1:n
        samples = [samples gm(i).mu + A(:,j,i) gm(i).mu - A(:,j,i)];
    end
end


end