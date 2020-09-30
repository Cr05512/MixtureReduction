function [gmr,init] = MRICTDGMRA(gmh,Nr,cost_meas,lambda,maxiter,kRandomInit)

gmr_init = cell(kRandomInit,1);
gmr_out = cell(kRandomInit,1);
Nh = length(gmh);
for k=1:kRandomInit
    %rng(randi(100));
    gmr_init{k} = gmh;
    for i=1:(Nh-Nr)
        ind = randperm(length(gmr_init{k}),2);
        if strcmp(cost_meas,'KLD')
            gmr_init{k}(ind(1)) = mpMerge([gmr_init{k}(ind(1)),gmr_init{k}(ind(2))]);
        elseif strcmp(cost_meas,'W2')
            gmr_init{k}(ind(1)) = WassersteinBarycenter([gmr_init{k}(ind(1)),gmr_init{k}(ind(2))],maxiter);
        end
        gmr_init{k}(ind(2)) = [];
    end
end

gmh_temp = gmh;
f_val = Inf;
f_val_prev = f_val;

score = Inf(kRandomInit,1);
for l=1:kRandomInit
    gmr = gmr_init{l};
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
    score(l) = CTD(gmh,gmr,cost_meas);
    gmr_out{l} = gmr;
end

[~,ind] = min(score);
gmr = gmr_out{ind};
init = gmr_init{ind};


end

