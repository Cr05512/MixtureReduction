function gmr = CTDGMRA(gmh,gmr,cost_meas,lambda,maxiter,I)
% gmr = CTDGMRA(gmh,gmr,cost_meas,lambda,maxiter,I):
% INPUTS:
% - gmh,gmr, two Gaussian mixtures,
% - cost_meas, desired cost function (possible choices: KLD, W2, GJSD, MKLD, L2),
% - lambda, regularization parameter,
% - I, number of virtual samples (only needed by the MKLD measure).
% OUTPUTS:
% - gmr, the refined mixture according to the CTDGMRA algorithm.
% This function implements the Composite Transportation Distance Gaussian
% mixture reduction algoirthm.
if nargin < 4
    lambda = 0.1;
    maxiter = 100;
    I = length(gmh);
elseif nargin < 5
    maxiter = 100;
    I = length(gmh);
elseif nargin < 6
    I = length(gmh);
end
assert(strcmp(cost_meas,'KLD') || strcmp(cost_meas,'W2') || strcmp(cost_meas,'GJSD') || strcmp(cost_meas,'MKLD') || strcmp(cost_meas,'L2'),...
            'The allowed cost functions are (1) KLD, (2) MKLD, (3) W2, (4) GJSD and (5) L2.');
assert(lambda>=0,'The regularization parameter has to be non-negative.');
assert(maxiter>=0,'The number of iterations has to be non-negative.');
assert(I>0,'The number of virtual samples has to be greater than 0.');

Nr = length(gmr);
gmh_temp = gmh;
J = Inf;
J_prev = J;


for k=1:maxiter
    
    C = CostMatrix(gmh,gmr,cost_meas,lambda,I);
    %pi_star = computeEROTP(C,[gmh.w]',[gmr.w]',lambda,maxiter);
    pi_star = EffEROTP(gmh,C,lambda); %It works only in this context, we are solving the opt problem by considering only one constraint
    
    J = trace(pi_star'*C) - lambda*MatrixEntropy(pi_star);

    if abs(J-J_prev) < 1e-12
        break;
    end

    wG = sum(pi_star,1);
    w_temp = num2cell(pi_star);
    for j=1:Nr
        if wG(j)>0
            [gmh_temp.w] = w_temp{:,j};
            if strcmp(cost_meas,'W2')
                gmr(j) = WassersteinBarycenter(gmh_temp,maxiter);
            else
                gmr(j) = mpMerge(gmh_temp);
            end
        end

    end
    
    ind_keep = find(wG>0);
    gmr = gmr(ind_keep);
    w_temp = wG';
    w_norm = num2cell(w_temp./sum(w_temp));
    [gmr.w] = w_norm{:};
    Nr = length(gmr);
    %wG = wG(ind_keep);
    J_prev = J;
    
end

end

