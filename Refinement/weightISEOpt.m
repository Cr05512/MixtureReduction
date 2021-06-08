function gmr = weightISEOpt(gmr,gmh)
% gmr = weightISEOpt(gmr,gmh):
% INPUT:
% gmr, gmh, two Gaussian mixtures.
% OUTPUT:
% gmr, weight-refined Gaussian mixture.
% This function implements a quadratic programming solver to optimize the
% GM weights according to the ISE measure.
Nr = numel(gmr);
[~,mur,Sigmar] = paramsFromMixture(gmr);
[wh,muh,Sigmah] = paramsFromMixture(gmh);
H1 = matrixUnwSelfLikeness(mur,Sigmar);

H2 = matrixUnwCrossLikeness(muh,Sigmah,mur,Sigmar);


f = -H2'*wh;

beq = 1;
Aeq = ones(1,Nr);

A = -eye(Nr);
b = zeros(Nr,1);

options = optimoptions('quadprog','Display','none');

wr = quadprog(H1,f,A,b,Aeq,beq,[],[],[],options);

wr_temp = num2cell(wr);
[gmr.w] = wr_temp{:};

end

