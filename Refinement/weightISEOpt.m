function gmr = weightISEOpt(gmr,gmh)
% gmr = weightISEOpt(gmh,gmr):
% INPUT:
% gmr, gmh, two Gaussian mixtures.
% OUTPUT:
% gmr, weight-refined Gaussian mixture.
% This function implements a quadratic programming solver to optimize the
% GM weights according to the ISE measure.

Nh = numel(gmh);
Nr = numel(gmr);
w = [gmh.w]';

H1 = zeros(Nr,Nr);
for i=1:Nr
    for j=1:Nr
        H1(i,j) = mvnpdf(gmr(i).mu,gmr(j).mu,gmr(i).Sigma + gmr(j).Sigma);
    end
end

H2 = zeros(Nh,Nr);

for i=1:Nh
    for j=1:Nr
        H2(i,j) = mvnpdf(gmh(i).mu,gmr(j).mu,gmh(i).Sigma + gmr(j).Sigma);
    end
end


f = -H2'*w;

beq = 1;
Aeq = ones(1,Nr);

A = -eye(Nr);
b = zeros(Nr,1);

options = optimoptions('quadprog','Display','none');

wr = quadprog(H1,f,A,b,Aeq,beq,[],[],[],options);

wr_temp = num2cell(wr);
[gmr.w] = wr_temp{:};

end

