function pi = computeEROTP(C,wF,wG,lambda,maxiter)
% pi = computeEROTP(C,wF,wG,lambda,maxiter):
% INPUTS:
% - C, the cost matrix (Nh x Nr matrix),
% - wF and wG, respectively the mixture weights (Nh x 1 and Nr x 1 vectors),
% - lambda, the regularization parameter (scalar),
% - maxiter, maximum number of allowed iterations (scalar).
% OUTPUTS:
% - pi, the entropic regularized optimal transportation plan (Nh x Nr matrix).
% Sinkhorn-Knopp algorithm to compute the entropic regularized optimal
% transportation plan in the case of Gaussian mixtures.

if nargin < 4
    lambda = 0;
    maxiter = 100;
elseif nargin < 5
    maxiter = 100;
end
assert(size(C,1)==length(wF) && size(C,2)==length(wG) && ~isempty(C),'Check input parameters, dimensions are inconsistent or C is empty.');
assert(lambda>=0,'The regularization parameter has to be non-negative.');
assert(maxiter>=0,'The number of iterations has to be non-negative.');


if lambda==0
    pi = computeOTP(C,wF,wG);
else
    Nh = length(wF);
    Nr = length(wG);

    M = exp(-C./lambda);


    pi = Inf(Nh,Nr);
    pi_prev = pi;
    % intialize u and v
    %u = ones(Nr,1);
    v = ones(Nh,1);

    % Sinkhorn-Knopp
    % iteratively scale rows and columns
    for k = 1:maxiter
        u = wG./(M'*v);
        v = wF./(M*u);
        pi = diag(v)*M*diag(u);
        if(norm(pi-pi_prev)<1e-12)
            break;
        else
            pi_prev = pi;
        end
    end
end

end

