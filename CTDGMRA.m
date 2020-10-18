function gmr = CTDGMRA(gmh,gmr,cost_meas,lambda,maxiter,I)
if nargin < 4
    lambda = 0.1;
    maxiter = 100;
    I = 10*length(gmh);
elseif nargin < 5
    maxiter = 100;
    I = 10*length(gmh);
elseif nargin < 6
    I = 10*length(gmh);
end
Nr = length(gmr);
gmh_temp = gmh;
J = Inf;
J_prev = J;


for k=1:maxiter
    
    C = CostMatrix(gmh,gmr,cost_meas,lambda,I);
    %pi_star = computeEROTP(C,[gmh.w]',[gmr.w]',lambda,maxiter);
    pi_star = EffEROTP(gmh,Nr,C,lambda); %It works only in this context, we are solving the opt problem by considering only one constraint
    
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
            elseif strcmp(cost_meas,'KLD') || strcmp(cost_meas,'MKLD')
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

