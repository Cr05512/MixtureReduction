function pi = computeEROTP(C,wF,wG,gamma,maxiter)
%Sinkhorn algorithm to compute the entropic regularized optimal
%transportation plan in the case of Gaussian mixtures
%C is the cost function
%wF and wG are respectively the mixture weights
 
Nh = length(wF);
Nr = length(wG);
 
M = exp(-C./gamma);


pi = Inf(Nh,Nr);
pi_prev = pi;
% intialize u and v
u = ones(Nr,1);
v = ones(Nh,1);
 
% Sinkhorn-Knopp
% iteratively scale rows and columns
for k = 1:maxiter
    % update u and v
    u = wG./(M'*v);
    v = wF./(M*u);
    % assemble pi
    pi = diag(v)*M*diag(u);
    if(norm(pi-pi_prev)<1e-12)
        break;
    else
        pi_prev = pi;
    end
end

end

