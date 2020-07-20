function bc = WassersteinBarycenter(gm,maxIter)
n = length(gm);

d = size(gm(1).Sigma,1);
S_prev = zeros(d,d);
mu_bar = zeros(d,1);
w_bar = 0;

for i=1:n
    w_bar = w_bar + gm(i).w;
    mu_bar = mu_bar + gm(i).w*gm(i).mu;
    S_prev = S_prev + gm(i).Sigma;
end
mu_bar = mu_bar./w_bar;
S_prev = S_prev./n;

for k=1:maxIter
    S = zeros(d,d);
    S_prev = real(sqrtm(S_prev));
    for i=1:n
        S = S + (gm(i).w/w_bar)*real(sqrtm(S_prev*gm(i).Sigma*S_prev));
    end
    if norm(real(sqrtm(S))-S_prev)<1e-10
        break;
    else
        S_prev = S;
    end
end

bc = struct('w',w_bar,'mu',mu_bar,'Sigma',S);
    
end

