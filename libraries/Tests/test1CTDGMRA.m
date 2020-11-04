function [gm,Nh,Nr,d,alpha] = test1CTDGMRA()
% [gm,Nh,Nr,d,alpha] = test1CTDGMRA()
% OUTPUTS:
% - gm, a Gaussian mixture,
% - Nh, new number of components for the original mixture,
% - Nr, new number of components for the reduced mixture,
% - d, new state dimension,
% - alpha, new mean spreading factor.
% This script emulates the test regarding the first mixture as in section 4.2 of:
% Q. Zhang and J. Chen. "A unified framework for gaussian mixture reduction
% with  composite  transportation  distance".arXiv:2002.08410v1  [stat.ML.],2020.
Nh = 8;
Nr = 4;
d = 2;

r = sqrt(2);

mu = [muGenCTDGMRA(r,pi/4) muGenCTDGMRA(r,pi/4) muGenCTDGMRA(r,3*pi/4) muGenCTDGMRA(r,3*pi/4)...
      muGenCTDGMRA(r,5*pi/4) muGenCTDGMRA(r,5*pi/4) muGenCTDGMRA(r,7*pi/4) muGenCTDGMRA(r,7*pi/4)];
  
Sigma1 = SigmaGenCTDGMRA(1, 0.01, 0);
Sigma2 = SigmaGenCTDGMRA(1, 0.01, pi/2);

alpha = 2*r;

gm(Nh,1) = struct('w',[],'mu',[],'Sigma',[]);

for i=1:Nh
    gm(i).w = 1/Nh;
    gm(i).mu = mu(:,i);
    if ~mod(i,2)
        gm(i).Sigma = Sigma1;
    else
        gm(i).Sigma = Sigma2;
    end
end


end

