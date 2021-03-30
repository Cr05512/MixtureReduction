function pdf_merged = W2Barycenter(gm,maxIter)
% pdf_merged = W2Barycenter(gm,maxIter):
% INPUTS:
% - gm, a Gaussian mixture (numComps x 1 vector),
% - maxIter, maximum number of allowed iterations in the covariance computation (scalar).
% OUTPUTS:
% - pdf_merged, merged component according to W2 dist (Gaussian component).
% This function computes the Wasserstein barycenter of several Gaussian
% components.
if nargin < 2
    maxIter = 100;
end
assert(~isempty(gm),'The mixture has to contain at least one element.');
assert(maxIter>0,'The number of iterations has to be greater than zero.');

N = numel(gm);

d = size(gm(1).mu,1);
S_prev = zeros(d,d);
mu_bar = zeros(d,1);
w_bar = sum([gm.w]);

for i=1:N
    mu_bar = mu_bar + gm(i).w*gm(i).mu;
    S_prev = S_prev + gm(i).w*gm(i).Sigma;
end
mu_bar = mu_bar./w_bar;
S_prev = S_prev./w_bar;

for k=1:maxIter
    S = zeros(d,d);
    S_prev = real(sqrtm(S_prev));
    %S_prev_inv = inv(S_prev);
    for i=1:N
        S = S + (gm(i).w/w_bar)*real(sqrtm(S_prev*gm(i).Sigma*S_prev));
    end
    S = S_prev_inv*S^2*S_prev_inv; %This multiplication can be avoided, but there is no result on the convergence
    if norm(real(sqrtm(S))-S_prev)<1e-10
        break;
    else
        S_prev = S;
    end
end

pdf_merged = struct('w',w_bar,'mu',mu_bar,'Sigma',S);
    
end

