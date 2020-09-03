function gm = GMGen(N,n,alpha,beta,delta)

w = rand(N,1);
w_bar = w./sum(w);

%Generate means
mu = -alpha*ones(n,N) + alpha*2*rand(n,N) + delta;

%Generate Symmetric Positive Definite Covariance matrices
Sigma = zeros(n,n,N);
for i=1:N
    sigma = rand(n,n); % generate a random nxn matrix
    % construct a symmetric matrix using either
    %sigma = 0.5*(sigma+sigma');
    sigma = sigma*sigma';
    sigma = sigma + beta*n*eye(n);
    Sigma(:,:,i) = sigma;
end

gm(size(mu,2),1) = struct('w',[],'mu',[],'Sigma',[]);
for i=1:size(mu,2)
    gm(i).w = w_bar(i);
    gm(i).mu = mu(:,i);
    gm(i).Sigma = Sigma(:,:,i);
end

end

