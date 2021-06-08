function [gm,newParams] = test3CTDGMRA()
% [gm,Nh,Nr,d,alpha] = test3CTDGMRA()
% OUTPUTS:
% - gm, a Gaussian mixture,
% - Nh, new number of components for the original mixture (scalar),
% - Nr, new number of components for the reduced mixture (scalar),
% - d, new state dimension (scalar),
% - alpha, new mean spreading factor (scalar).
% This script emulates the test regarding the third and fourth mixtures as in section 4.2 of:
% Q. Zhang and J. Chen. "A unified framework for gaussian mixture reduction
% with  composite  transportation  distance".arXiv:2002.08410v1  [stat.ML.],2020.
% Set Nr to 6 in order to emulate the third experiment or set Nr to 12 to
% emulate the fourth experiment.

Nh = 18;
d = 2;


Sigma = zeros(d,d,Nh);
l = 1;
for k=0:5
    Sigma(:,:,l) = SigmaGenCTDGMRA(0.001, 1, pi*k/6);
    Sigma(:,:,l+1) = SigmaGenCTDGMRA(0.01, 1, pi*k/6);
    Sigma(:,:,l+2) = SigmaGenCTDGMRA(0.1, 1, pi*k/6);
    l = l + 3;
end

r = 0.5;

gm(Nh,1) = struct('w',[],'mu',[],'Sigma',[]);
newParams = struct('Nh',Nh,'d',d);

for i=1:Nh
    gm(i).w = 1/Nh;
    gm(i).mu = zeros(d,1);
    gm(i).Sigma = Sigma(:,:,i);
end


end

