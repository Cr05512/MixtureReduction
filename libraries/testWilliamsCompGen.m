function [gm,Nh,Nr,d,delta] = testWilliamsCompGen()
% gm = testWilliamsCompGen():
% OUTPUTS:
% - gm, a Gaussian mixture
% - Nh, new number of original components,
% - Nr, new number of reduced components,
% - d, new state dimension,
% - delta, new components center.
% This script generates a Gaussian mixture with parameters taken from
% Williams' Master thesis example at page 1 of section 4.
% Link to the Master thesis: http://ssg.mit.edu/group/jlwil/publications/Wil03.pdf

d = 1;
Nh = 5;
Nr = 2;
%w = [0.34 0.32 0.34]';
w = [0.083 0.167 0.25 0.333 0.167]';
mu = [1 2 3 4 10]';
Sigma = [0.1 20 2 2 2];
delta = (max(mu)-min(mu))/2;

gm = struct('w',[],'mu',[],'Sigma',[]);

for i=1:length(w)
    gm(i).w = w(i);
    gm(i).mu = mu(i);
    gm(i).Sigma = Sigma(i);
end


end

