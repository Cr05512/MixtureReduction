function pi = computeOTPEntropicRegularized(gmh,gmr)
%Sinkhorn algorithm to compute the optimal transportation plan between the
%original and the reduced mixture (Entropic Regularized)
gamma = 1; %reg for entropy. With this parameter and by removing the sqrt on the distance we obtain the same behavior as Assa Plataniotis' paper
maxiter = 100; % maxiter
 
Nh = length(gmh);
Nr = length(gmr);
 
% marginals
p = [gmh.w]'; %for colums sum
q = [gmr.w]'; % for row sum
 
M = zeros(Nh,Nr);
for i=1:length(gmh)
    for j=1:length(gmr)
        M(i,j) = Wasserstein2Dist(gmh(i),gmr(j));
    end
end

M = exp(-M./gamma);


pi = Inf(Nh,Nr);
pi_prev = pi;
% intialize u and v
u = ones(Nr,1);v = ones(Nh,1);
 
% Sinkhorn-Knopp
% iteratively scale rows and columns
for k = 1:maxiter
    % update u and v
    u = q./(M'*v);
    v = p./(M*u);
    % assemble pi
    pi = diag(v)*M*diag(u);
    if(norm(pi-pi_prev)<1e-12)
        break;
    else
        pi_prev = pi;
    end
end

end

