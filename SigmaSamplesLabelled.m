function labSamples = SigmaSamplesLabelled(gm)
% labSamples = SigmaSamplesLabelled(gm):
% INPUTS:
% - gm, a Gaussian mixture.
% OUTPUTS:
% - labSamples, a struct containing the labelled sigma points.
% This function computes the sigma points of each component in the mixture
% and assigns to them the corresponding label indicating from which element
% they have been generated.
assert(~isempty(gm),'The mixture has to contain at least one element.');

n = size(gm(1).mu,1);
N = length(gm);
labSamples = struct('data',[gm.mu]','label',(1:N)');
samples = [];
labels = [];

lambda = 3-n;
samples = [samples [gm.mu]];
labels = [labels (1:N)];
A = reshape([gm.Sigma],n,n,N);


for i=1:N
    A(:,:,i) = sqrt(lambda+n)*chol(A(:,:,i));
    for j=1:n
        samples = [samples gm(i).mu + A(:,j,i) gm(i).mu - A(:,j,i)];
        labels = [labels i i];
    end
end

labSamples.data = samples';
labSamples.label = labels';

end