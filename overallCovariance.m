function P = overallCovariance(gm)
%This function computes the overall covariance of a GM

mu = size(gm(1).getMean());

for i=1:length(gm)
    mu = mu + gm(i).getWeight()*gm(i).getMean();
end

W = zeros(size(gm(1).getCovariance()));
B = W;

for i=1:length(gm)
    W = W + gm(i).getWeight()*gm(i).getCovariance();
    B = B + gm(i).getWeight()*(gm(i).getMean() - mu)*(gm(i).getMean() - mu)';    
end

P = W + B;

end

