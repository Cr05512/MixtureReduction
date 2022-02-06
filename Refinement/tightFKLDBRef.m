function gmr = tightFKLDBRef(gmr,gmh,I,maxiter,tol)
if nargin < 3
    maxiter = 100;
    tol = 1e-9;
elseif nargin < 4
    tol = 1e-9;
end

Nh = numel(gmh);
Nr = numel(gmr);
wa = [gmh.w]';
gmh_temp = gmh;
J = Inf;
J_prev = J;
C = zeros(Nh,Nr);
pi_star = zeros(Nh,Nr);
for k=1:maxiter
    
    for i=1:Nh
        for j=1:Nr
            C(i,j) = MKLDij(gmh(i),gmr(j),I);
        end
    end
 
    for i=1:Nh
        expCi = exp(-C(i,:));
        piTmp = wa(i)*expCi/sum(expCi);
        if ~any(isnan(piTmp))
            pi_star(i,:) = piTmp;
        end
    end

    wb = sum(pi_star,1)';

    w_temp = num2cell(pi_star);
    for j=1:Nr
        if wb(j)>0
            [gmh_temp.w] = w_temp{:,j};
            gmr(j) = FKLDBarycenter(gmh_temp);
        end

    end
    
    gmr = gmr(wb>0);
    wb = wb(wb>0);
    w_norm = num2cell(wb./sum(wb));
    [gmr.w] = w_norm{:};
    Nr = length(gmr);
    
    J = trace(pi_star'*C) - MatrixEntropy(pi_star);

    if abs(J-J_prev) < tol
        break;
    end
    J_prev = J;
    
end



end