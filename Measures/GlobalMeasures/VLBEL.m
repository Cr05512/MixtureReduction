function L = VLBEL(gmh,gmr,I)
% L = VLBEL(gmh,gmr,E,I):
% INPUTS:
% - gmh, gmr, two Gaussian mixtures,
% - I, number of virtual samples (scalar).
% OUTPUTS:
% - L, variational lower bound for the expected log-likelihood (scalar).
% This function computes the variational lower bound for the expected
% log-likelihood.
if nargin < 3
    I = numel(gmh);
end
assert(~isempty(gmh) && ~isempty(gmr),'The mixtures have to contain at least one element.');
assert(I>0,'The number of virtual samples has to be greater than zero.');

Nh = numel(gmh);
Nr = numel(gmr);
L = 0;
E = zeros(Nh,Nr);
Z = zeros(Nh,Nr); %Responsibilities

for i=1:Nh
    for j=1:Nr
        E(i,j) = funEij(gmh(i),gmr(j));
    end
end

expNE = exp(I*E);

for i=1:Nh
    for j=1:Nr
        Z(i,j) = gmr(j).w*expNE(i,j);
    end
    Z(i,:) = Z(i,:)./sum(Z(i,:));
end
    
for i=1:Nh
    for j=1:Nr
        if Z(i,j)>0
            L = L + gmh(i).w*Z(i,j)*(log(gmr(j).w/Z(i,j)) + E(i,j));
        end
    end
end

L = I*L;

end

