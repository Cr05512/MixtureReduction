function samples = SigmaPointsGM(gm)

%Labelled Sigma points

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