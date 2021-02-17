function gmr = weightISEOpt(gmr,gmh)
% gmr = weightISEOpt(gmr,gmh):
% INPUT:
% gmr, gmh, two Gaussian mixtures.
% OUTPUT:
% gmr, weight-refined Gaussian mixture.
% This function implements a quadratic programming solver to optimize the
% GM weights according to the ISE measure.
Nr = numel(gmr);
w = [gmh.w]';

H1 = matrixUnwSelfLikeness(gmr);

H2 = matrixUnwCrossLikeness(gmh,gmr);


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

