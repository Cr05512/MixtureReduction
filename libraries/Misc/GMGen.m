function gm = GMGen(N,d,alpha,beta,delta)
% gm = GMGen(N,n,alpha,beta,delta):
% INPUTS:
% - N, number of desired components in the mixture,
% - d, state dimension,
% - alpha, tuning parameter which accounts for the spread of the means.
%   This parameter tunes the boundaries of the uniform distribution used to
%   generate the means randomly,
% - beta, tuning parameter which accounts for the average covariance of the
%   components. The covariance matrices are generated according to a Wishart
%   distribution with average covariance beta*eye(d) and d+5 degrees of
%   freedom,
% - delta, tuning parameter which accounts for the mean value of the means.
% OUTPUTS:
% - gm, the newly generated Gaussian mixture.
% This function generates a Gaussian mixture with N d-dimensional
% components. The weights are sampled from a uniform distribution in the
% range [0.05,0.5] before renormalization (necessary to satisfy the weight
% unitary sum constraint),
% the means are sampled from a uniform distribution in the range [-alpha + delta, delta + alpha],
% the covariance matrices are sampled from the Wishart distribution with the "average" covariance equal
% to P_bar = beta*eye(d)*(d+5).

assert(N>0 && floor(N)==N,'The mixture has to contain at least one element.');
assert(d>0 && floor(d)==d,'The state dimension has to be a positive integer.');
assert(alpha>0 && beta>0,'The parameters alpha and beta have to be greater than zero.');


w = 0.05 + 0.45*rand(N,1);
w_bar = w./sum(w);

%Generate means
mu = -alpha*ones(d,N) + alpha*2*rand(d,N) + delta;

%Generate Symmetric Positive Definite Covariance matrices
Sigma = zeros(d,d,N);
for i=1:N
    %sigma = rand(d,d); % generate a random nxn matrix
    % construct a symmetric matrix using either
    %sigma = 0.5*(sigma+sigma');
    %sigma = sigma*sigma';
    %sigma = sigma + beta*eye(n);
    sigma = wishrnd(beta*eye(d),d+5);
    Sigma(:,:,i) = sigma;
end

gm(size(mu,2),1) = struct('w',[],'mu',[],'Sigma',[]);
for i=1:size(mu,2)
    gm(i).w = w_bar(i);
    gm(i).mu = mu(:,i);
    gm(i).Sigma = Sigma(:,:,i);
end

end

