function pdf = MLEstimation(X)
n = size(X,2); %Number of samples
d = size(X,1);
mu =sum(X,2)/n;
Sigma = zeros(d,d);
for i=1:n
    Sigma = Sigma + (X(:,i)-mu)*(X(:,i)-mu)';
end
Sigma = Sigma/(n);
pdf = struct('w',1,'mu',mu,'Sigma',Sigma);


end