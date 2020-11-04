function [gm,Nr,d] = test5CompGen(alpha,beta)
% test5CompGen():
% INPUTS:
% - alpha, mean spreading factor,
% - beta, covariance tuning parameter.
% OUTPUTS:
% - gm, a Gaussian mixture.
% - Nr, new reduced mixture components,
% - d, new state dimension.
% This script generates 2 components in one dimension symmetric with
% respect to the origin.
% By changing alpha and beta it is possible to observe the reduction behavior in the
% case of "far" or "close" components.

d = 1;
Nr = 1;
w = [0.5;0.5]';
mu = alpha*[-1 1];
Sigma = wishrnd(beta*eye(d),d+5);

gm = struct('w',[],'mu',[],'Sigma',[]);

for i=1:2
    gm(i).w = w(i);
    gm(i).mu = mu(i);
    gm(i).Sigma = Sigma;
end


end

