function [gm,Nh,Nr,d] = test5CompGen()
% test5CompGen():
% OUTPUTS:
% - gm, a Gaussian mixture.
% This script generates 3 components in one dimension with one of them
% having a smaller weight.

d = 1;
Nh = 2;
Nr = 1;
%w = [0.34 0.32 0.34]';
w = [0.5;0.5]';
mu = 10*[-1 1];
Sigma = 4*ones(2,1)';

gm = struct('w',[],'mu',[],'Sigma',[]);

for i=1:2
    gm(i).w = w(i);
    gm(i).mu = mu(i);
    gm(i).Sigma = Sigma(i);
end


end

