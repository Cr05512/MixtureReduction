function labSamples = SigmaSamplesLabelled(gm)

%Labelled Sigma points

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