function [gm,Nh,Nr,d,alpha] = test2CTDGMRA()
% [gm,Nh,Nr,d,alpha] = test2CTDGMRA()
% OUTPUTS:
% - gm, a Gaussian mixture,
% - Nh, new number of components for the original mixture,
% - Nr, new number of components for the reduced mixture,
% - d, new state dimension,
% - alpha, new mean spreading factor.
% This script emulates the test regarding the second mixture as in section 4.2 of:
% Q. Zhang and J. Chen. "A unified framework for gaussian mixture reduction
% with  composite  transportation  distance".arXiv:2002.08410v1  [stat.ML.],2020.

Nh = 32;
Nr = 16;
d = 2;


mu = [];
for k=0:15
    mu = [mu muGenCTDGMRA(1,2*pi*k/16) muGenCTDGMRA(1.5,2*pi*k/16)];
end


Sigma = zeros(d,d,Nh);
for k=0:15
    Sigma(:,:,2*k+1) = SigmaGenCTDGMRA(0.1, 0.01, 2*pi*k/16);
    Sigma(:,:,2*k+2) = SigmaGenCTDGMRA(0.1, 0.01, 2*pi*k/16);
end

r = 1.5;
alpha = 2*r;

gm(Nh,1) = struct('w',[],'mu',[],'Sigma',[]);

for i=1:Nh
    gm(i).w = 1/Nh;
    gm(i).mu = mu(:,i);
    gm(i).Sigma = Sigma(:,:,i);
end


end

