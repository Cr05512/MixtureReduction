function gm = GMGen(N,d,gamma,beta,delta)
% gm = GMGen(N,n,alpha,beta,delta):
% INPUTS:
% - N, number of desired components in the mixture (scalar),
% - d, state dimension (scalar),
% - gamma, tuning parameter which accounts for the spread of the means.
%   This parameter tunes the boundaries of the uniform distribution used to
%   generate the means randomly (scalar),
% - beta, tuning parameter which accounts for the average covariance of the
%   components. The covariance matrices are generated according to a Wishart
%   distribution with average covariance beta*eye(d) and d+5 degrees of
%   freedom (scalar),
% - delta, tuning parameter which accounts for the offset along the delta x ones(stateDim,1) vector of the means (scalar).
% OUTPUTS:
% - gm, the newly generated Gaussian mixture.
% This function generates a Gaussian mixture with N d-dimensional
% components. The weights are sampled from a uniform distribution in the
% range [0.05,0.5] before renormalization (necessary to satisfy the weight
% unitary sum constraint),
% the means are sampled from a uniform distribution in the range [-alpha + delta, delta + alpha],
% the covariance matrices are sampled from the Wishart distribution with the "average" covariance equal
% to P_bar = beta*eye(d)*(d+5).

if nargin < 2
    d = 1;
    gamma = N/2;
    beta = 0.09;
    delta = zeros(d,1);
elseif nargin < 3
    gamma = N/2;
    beta = 0.09;
    delta = zeros(d,1);
elseif nargin < 4
    beta = 0.09;
    delta = zeros(d,1);
elseif nargin < 5
    delta = zeros(d,1);
end

assert(N>0 && floor(N)==N,'The mixture has to contain at least one element.');
assert(d>0 && floor(d)==d,'The state dimension has to be a positive integer.');
assert(gamma>0 && beta>0,'The parameters alpha and beta have to be greater than zero.');

w = 0.05 + 0.45*rand(N,1);
w_bar = w./sum(w);

%Generate means
mu = -gamma*ones(d,N) + gamma*2*rand(d,N) + delta;
%mu = zeros(2,1);

%Generate Symmetric Positive Definite Covariance matrices
Sigma = zeros(d,d,N);
for i=1:N
    %sigma = rand(d,d); % generate a random nxn matrix
    % construct a symmetric matrix using either
    %sigma = 0.5*(sigma+sigma');
    %sigma = sigma*sigma';
    %sigma = sigma + beta*eye(n);
    sigma = wishrnd(beta*eye(d),2*d+5);
    %sigma = eye(2);
    Sigma(:,:,i) = sigma;
end

gm = genMixtureFromParams(w_bar,mu,Sigma);

end

