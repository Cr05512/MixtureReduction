function gmr = CTDGMRA(gmh,gmr,cost_meas,lambda,maxiter)
Nr = length(gmr);
gmh_temp = gmh;
f_val = Inf;
f_val_prev = f_val;


for k=1:maxiter
    
    C = CostMatrix(gmh,gmr,cost_meas);
    pi_star = EffEROTP(gmh,Nr,C,lambda);
    
    f_val = trace(pi_star'*C) - lambda*MatrixEntropy(pi_star);

    if norm(f_val-f_val_prev) < 1e-15
        break;
    end

    wG = sum(pi_star,1);
    w_temp = num2cell(pi_star);
    for j=1:Nr
        if wG(j)>0
            [gmh_temp.w] = w_temp{:,j};
            if strcmp(cost_meas,'W2')
                gmr(j) = WassersteinBarycenter(gmh_temp,maxiter);
            elseif strcmp(cost_meas,'KLD')
                gmr(j) = mpMerge(gmh_temp);
            end
        end

    end
    
    ind_keep = find(wG>0);
    gmr = gmr(ind_keep);
    w_temp = [gmr.w]';
    w_norm = num2cell(w_temp./sum(w_temp));
    [gmr.w] = w_norm{:};
    Nr = length(gmr);
    %wG = wG(ind_keep);
    f_val_prev = f_val;
    
end

end

