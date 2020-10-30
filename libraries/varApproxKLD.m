function varKLD = varApproxKLD(gmh,gmr)
% varKLD = varApproxKLD(gmh,gmr):
% INPUTS:
% - gmh, gmr, two Gaussian mixtures.
% OUTPUTS:
% - varKLD, variational approximation of the KLD.
% This function implements the computation of a variational approximation for the KLD between two
% mixtures as shown in:
% "Approximating the Kullback Leibler Divergence Between Gaussian Mixture
% Models", J. R. Hershey, P. Olsen, Conference: Acoustics, Speech and Signal
% Processing, 2007. ICASSP 2007. IEEE International Conference onVolume: 4
% NOTE: the positivity property of the KLD does not hold with this
% approximation.

assert(~isempty(gmh) && ~isempty(gmr),'The mixtures have to contain at least one element.');

Nh = length(gmh);
Nr = length(gmr);
varKLD = 0;

for i=1:Nh
    num = 0;
    for j=1:Nh
        num = num + gmh(j).w*exp(-KLD(gmh(i),gmh(j)));
    end
    
    den = 0;
    for j=1:Nr
        den = den + gmr(j).w*exp(-KLD(gmh(i),gmr(j)));
    end
    
    varKLD = varKLD + gmh(i).w*log(num/den);
end
end

